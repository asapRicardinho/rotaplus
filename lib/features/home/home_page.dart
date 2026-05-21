import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constants/app_strings.dart';
import '../../shared/widgets/primary_button.dart';
import '../../shared/widgets/section_card.dart';
import '../career_tips/career_tips_page.dart';
import '../credits/credits_page.dart';
import '../interview/interview_tips_page.dart';
import '../privacy_terms/privacy_terms_page.dart';
import '../privacy_terms/privacy_terms_document.dart';
import '../resume_builder/resume_form_page.dart';
import '../vocational_test/vocational_test_page.dart';

const _privacyAcceptedKey = 'privacy_terms_accepted_v1';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool? _hasAcceptedPrivacyTerms;

  @override
  void initState() {
    super.initState();
    _loadPrivacyTermsStatus();
  }

  Future<void> _loadPrivacyTermsStatus() async {
    final preferences = await SharedPreferences.getInstance();

    if (!mounted) return;
    setState(() {
      _hasAcceptedPrivacyTerms =
          preferences.getBool(_privacyAcceptedKey) ?? false;
    });
  }

  Future<void> _acceptPrivacyTerms() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setBool(_privacyAcceptedKey, true);

    if (!mounted) return;
    setState(() {
      _hasAcceptedPrivacyTerms = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
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
                        onPressed: () =>
                            _open(context, const VocationalTestPage()),
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
                        onPressed: () =>
                            _open(context, const InterviewTipsPage()),
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
        ),
        if (_hasAcceptedPrivacyTerms == false)
          PrivacyTermsConsentOverlay(onAccepted: _acceptPrivacyTerms),
      ],
    );
  }

  void _open(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
  }
}

class PrivacyTermsConsentOverlay extends StatefulWidget {
  const PrivacyTermsConsentOverlay({required this.onAccepted, super.key});

  final Future<void> Function() onAccepted;

  @override
  State<PrivacyTermsConsentOverlay> createState() =>
      _PrivacyTermsConsentOverlayState();
}

class _PrivacyTermsConsentOverlayState
    extends State<PrivacyTermsConsentOverlay> {
  bool _hasConfirmedReading = false;
  bool _isSaving = false;

  Future<void> _accept() async {
    if (!_hasConfirmedReading || _isSaving) return;

    setState(() {
      _isSaving = true;
    });
    await widget.onAccepted();

    if (!mounted) return;
    setState(() {
      _isSaving = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Positioned.fill(
      child: Material(
        color: Colors.black54,
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 680),
              child: FractionallySizedBox(
                heightFactor: 0.9,
                child: Card(
                  margin: const EdgeInsets.all(16),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.privacy_tip_outlined,
                              color: theme.colorScheme.secondary,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Política de Privacidade',
                                style: theme.textTheme.headlineSmall,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Expanded(
                          child: SingleChildScrollView(
                            child: PrivacyTermsDocument(showHeader: false),
                          ),
                        ),
                        const Divider(height: 24),
                        CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.leading,
                          value: _hasConfirmedReading,
                          onChanged: (value) {
                            setState(() {
                              _hasConfirmedReading = value ?? false;
                            });
                          },
                          title: const Text(
                            'Confirmo que li e estou ciente da Política de '
                            'Privacidade do aplicativo ROTA+.',
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: _hasConfirmedReading && !_isSaving
                                ? _accept
                                : null,
                            icon: _isSaving
                                ? const SizedBox.square(
                                    dimension: 18,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Icon(Icons.check_circle_outline),
                            label: const Text('Aceitar e continuar'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
