import 'package:flutter/material.dart';

import '../../core/constants/app_strings.dart';
import '../../shared/widgets/primary_button.dart';
import '../../shared/widgets/section_card.dart';
import '../career_tips/career_tips_page.dart';
import '../credits/credits_page.dart';
import '../interview/interview_tips_page.dart';
import '../privacy_terms/privacy_terms_page.dart';
import '../resume_builder/resume_form_page.dart';
import '../vocational_test/vocational_test_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.appName)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              AppStrings.slogan,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 14),
            Text(AppStrings.appDescription),
            const SizedBox(height: 24),
            SectionCard(
              title: 'Comece sua jornada',
              icon: Icons.explore_outlined,
              child: Column(
                children: [
                  PrimaryButton(
                    label: 'Teste vocacional',
                    icon: Icons.quiz_outlined,
                    onPressed: () => _open(context, const VocationalTestPage()),
                  ),
                  const SizedBox(height: 12),
                  PrimaryButton(
                    label: 'Criar currículo',
                    icon: Icons.description_outlined,
                    onPressed: () => _open(context, const ResumeFormPage()),
                  ),
                  const SizedBox(height: 12),
                  PrimaryButton(
                    label: 'Dicas de carreira',
                    icon: Icons.lightbulb_outline,
                    onPressed: () => _open(context, const CareerTipsPage()),
                  ),
                  const SizedBox(height: 12),
                  PrimaryButton(
                    label: 'Dicas de entrevista',
                    icon: Icons.record_voice_over_outlined,
                    onPressed: () => _open(context, const InterviewTipsPage()),
                  ),
                  const SizedBox(height: 12),
                  PrimaryButton(
                    label: 'Termos de privacidade',
                    icon: Icons.privacy_tip_outlined,
                    onPressed: () =>
                        _open(context, const PrivacyTermsPage()),
                  ),
                  const SizedBox(height: 12),
                  PrimaryButton(
                    label: 'Créditos',
                    icon: Icons.school_outlined,
                    onPressed: () => _open(context, const CreditsPage()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _open(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
  }
}
