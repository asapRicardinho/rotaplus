import 'package:flutter/material.dart';

import 'privacy_terms_content.dart';

class PrivacyTermsDocument extends StatelessWidget {
  const PrivacyTermsDocument({this.showHeader = true, super.key});

  final bool showHeader;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showHeader) ...[
          Text(PrivacyTermsContent.title, style: theme.textTheme.headlineSmall),
          const SizedBox(height: 4),
          const Text(PrivacyTermsContent.appName),
          const SizedBox(height: 16),
        ],
        DecoratedBox(
          decoration: BoxDecoration(
            color: colorScheme.primary.withValues(alpha: 0.06),
            border: Border(
              left: BorderSide(color: colorScheme.primary, width: 4),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Padding(
            padding: EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _MetaLine(
                  label: 'Última atualização',
                  value: PrivacyTermsContent.lastUpdated,
                ),
                _MetaLine(
                  label: 'Responsáveis',
                  value: PrivacyTermsContent.responsibles,
                ),
                _MetaLine(
                  label: 'Contato para privacidade',
                  value: PrivacyTermsContent.contactEmail,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        const _PublicUrlBox(),
        const SizedBox(height: 18),
        for (final section in PrivacyTermsContent.sections)
          _PrivacySection(section: section),
        const SizedBox(height: 8),
        Center(
          child: Text(
            '© 2026 ROTA+ - Desenvolvido para fins acadêmicos e de utilidade pública.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}

class _PublicUrlBox extends StatelessWidget {
  const _PublicUrlBox();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE3E8EF)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.link, color: colorScheme.secondary, size: 22),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'URL pública desta política',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  SelectableText(
                    PrivacyTermsContent.publicUrl,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.secondary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MetaLine extends StatelessWidget {
  const _MetaLine({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '$label: ',
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}

class _PrivacySection extends StatelessWidget {
  const _PrivacySection({required this.section});

  final PrivacyTermsSection section;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(section.title, style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          for (final paragraph in section.paragraphs) ...[
            Text(paragraph, textAlign: TextAlign.justify),
            const SizedBox(height: 8),
          ],
          for (final bullet in section.bullets)
            Padding(
              padding: const EdgeInsets.only(left: 6, bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• '),
                  Expanded(child: Text(bullet, textAlign: TextAlign.justify)),
                ],
              ),
            ),
          if (section.highlightTitle != null &&
              section.highlightText != null) ...[
            const SizedBox(height: 6),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).colorScheme.secondary.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFD7DEE8)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      section.highlightTitle!,
                      style: const TextStyle(fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 6),
                    Text(section.highlightText!, textAlign: TextAlign.justify),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
