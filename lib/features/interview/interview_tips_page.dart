import 'package:flutter/material.dart';

import '../../shared/widgets/section_card.dart';
import 'data/interview_tips_data.dart';

class InterviewTipsPage extends StatelessWidget {
  const InterviewTipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dicas de entrevista')),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(20),
          itemCount: interviewTips.length,
          separatorBuilder: (_, _) => const SizedBox(height: 14),
          itemBuilder: (context, index) {
            final item = interviewTips[index];
            return SectionCard(
              title: item.question,
              icon: Icons.question_answer_outlined,
              child: Text(item.tip),
            );
          },
        ),
      ),
    );
  }
}
