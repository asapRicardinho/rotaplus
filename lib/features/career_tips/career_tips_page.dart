import 'package:flutter/material.dart';

import '../../shared/widgets/section_card.dart';
import 'data/career_tips_data.dart';

class CareerTipsPage extends StatelessWidget {
  const CareerTipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dicas de carreira')),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(20),
          itemCount: careerTips.length,
          separatorBuilder: (_, _) => const SizedBox(height: 14),
          itemBuilder: (context, index) {
            return SectionCard(
              title: 'Dica ${index + 1}',
              icon: Icons.check_circle_outline,
              child: Text(careerTips[index]),
            );
          },
        ),
      ),
    );
  }
}
