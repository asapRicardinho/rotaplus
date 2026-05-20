import 'package:flutter/material.dart';

import '../../shared/widgets/primary_button.dart';
import '../../shared/widgets/section_card.dart';
import 'models/resume_model.dart';
import 'services/resume_pdf_service.dart';

class ResumePreviewPage extends StatelessWidget {
  const ResumePreviewPage({required this.resume, super.key});

  final ResumeModel resume;
  static const _pdfService = ResumePdfService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pré-visualização')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    resume.fullName,
                    style: Theme.of(
                      context,
                    ).textTheme.headlineSmall?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _personalInfo,
                    style: const TextStyle(color: Colors.white, height: 1.4),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              label: 'Baixar PDF',
              icon: Icons.download_outlined,
              onPressed: () => _downloadPdf(context),
            ),
            const SizedBox(height: 16),
            _ResumeSection(
              title: 'Objetivo profissional',
              content: resume.objective,
            ),
            _ResumeSection(
              title: 'Formação acadêmica',
              content: resume.education,
            ),
            _ResumeSection(
              title: 'Cursos complementares',
              content: resume.courses,
            ),
            _ResumeSection(title: 'Habilidades', content: resume.skills),
            _ResumeSection(
              title: 'Experiências ou projetos',
              content: resume.experiences,
            ),
            _ResumeSection(title: 'Idiomas', content: resume.languages),
          ],
        ),
      ),
    );
  }

  String get _personalInfo {
    final details = [
      if (resume.age.isNotEmpty) '${resume.age} anos',
      if (resume.city.isNotEmpty) resume.city,
      resume.email,
      resume.phone,
    ];
    return details.join(' • ');
  }

  Future<void> _downloadPdf(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);

    try {
      await _pdfService.downloadResume(resume);
    } catch (_) {
      messenger.showSnackBar(
        const SnackBar(
          content: Text('Não foi possível gerar o PDF. Tente novamente.'),
        ),
      );
    }
  }
}

class _ResumeSection extends StatelessWidget {
  const _ResumeSection({required this.title, required this.content});

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: SectionCard(
        title: title,
        child: Text(content.isEmpty ? 'Não informado' : content),
      ),
    );
  }
}
