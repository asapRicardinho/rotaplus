import 'package:flutter/material.dart';

import '../../shared/widgets/primary_button.dart';
import '../../shared/widgets/section_card.dart';
import 'data/vocational_questions.dart';
import 'vocational_result_page.dart';

class VocationalTestPage extends StatefulWidget {
  const VocationalTestPage({super.key});

  @override
  State<VocationalTestPage> createState() => _VocationalTestPageState();
}

class _VocationalTestPageState extends State<VocationalTestPage> {
  final Map<int, String> _selectedAreas = {};

  @override
  Widget build(BuildContext context) {
    final answeredAll = _selectedAreas.length == vocationalQuestions.length;

    return Scaffold(
      appBar: AppBar(title: const Text('Teste vocacional')),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(20),
          itemCount: vocationalQuestions.length + 1,
          separatorBuilder: (_, _) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            if (index == vocationalQuestions.length) {
              return PrimaryButton(
                label: 'Ver resultado',
                icon: Icons.arrow_forward,
                onPressed: answeredAll ? _showResult : null,
              );
            }

            final question = vocationalQuestions[index];
            return SectionCard(
              title: '${index + 1}. ${question.text}',
              child: RadioGroup<String>(
                groupValue: _selectedAreas[index],
                onChanged: (value) {
                  if (value == null) return;
                  setState(() => _selectedAreas[index] = value);
                },
                child: Column(
                  children: question.answers.map((answer) {
                    return RadioListTile<String>(
                      contentPadding: EdgeInsets.zero,
                      title: Text(answer.text),
                      value: answer.area,
                    );
                  }).toList(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showResult() {
    final scores = <String, int>{};
    for (final area in _selectedAreas.values) {
      scores[area] = (scores[area] ?? 0) + 1;
    }

    final bestArea = scores.entries
        .reduce((a, b) => a.value >= b.value ? a : b)
        .key;
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => VocationalResultPage(area: bestArea)),
    );
  }
}
