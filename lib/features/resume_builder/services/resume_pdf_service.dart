import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../models/resume_model.dart';

class ResumePdfService {
  const ResumePdfService();

  Future<void> downloadResume(ResumeModel resume) async {
    final bytes = await _buildResumePdf(resume);
    await Printing.sharePdf(
      bytes: bytes,
      filename: _buildFileName(resume.fullName),
    );
  }

  Future<Uint8List> _buildResumePdf(ResumeModel resume) async {
    final document = pw.Document();

    document.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(36),
        build: (context) => [
          pw.Text(
            resume.fullName,
            style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 8),
          pw.Text(
            _personalInfo(resume),
            style: const pw.TextStyle(fontSize: 11),
          ),
          pw.SizedBox(height: 18),
          _section('Objetivo profissional', resume.objective),
          _section('Formação acadêmica', resume.education),
          _section('Cursos complementares', resume.courses),
          _section('Habilidades', resume.skills),
          _section('Experiências ou projetos', resume.experiences),
          _section('Idiomas', resume.languages),
        ],
      ),
    );

    return document.save();
  }

  pw.Widget _section(String title, String content) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 14),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            title,
            style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 4),
          pw.Container(height: 1, color: PdfColors.grey300),
          pw.SizedBox(height: 6),
          pw.Text(
            content.isEmpty ? 'Não informado' : content,
            style: const pw.TextStyle(fontSize: 11, lineSpacing: 2),
          ),
        ],
      ),
    );
  }

  String _personalInfo(ResumeModel resume) {
    final details = [
      if (resume.age.isNotEmpty) '${resume.age} anos',
      if (resume.city.isNotEmpty) resume.city,
      resume.email,
      resume.phone,
    ];
    return details.join(' | ');
  }

  String _buildFileName(String fullName) {
    final normalizedName = fullName
        .trim()
        .toLowerCase()
        .replaceAll(RegExp(r'\s+'), '_')
        .replaceAll(RegExp(r'[^a-z0-9_]'), '');

    final suffix = normalizedName.isEmpty ? 'curriculo' : normalizedName;
    return 'curriculo_$suffix.pdf';
  }
}
