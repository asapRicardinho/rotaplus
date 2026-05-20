import 'package:flutter/material.dart';

import '../../shared/widgets/custom_text_field.dart';
import '../../shared/widgets/primary_button.dart';
import '../../shared/widgets/section_card.dart';
import 'models/resume_model.dart';
import 'resume_preview_page.dart';

class ResumeFormPage extends StatefulWidget {
  const ResumeFormPage({super.key});

  @override
  State<ResumeFormPage> createState() => _ResumeFormPageState();
}

class _ResumeFormPageState extends State<ResumeFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _cityController = TextEditingController();
  final _objectiveController = TextEditingController();
  final _educationController = TextEditingController();
  final _coursesController = TextEditingController();
  final _skillsController = TextEditingController();
  final _experiencesController = TextEditingController();
  final _languagesController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _cityController.dispose();
    _objectiveController.dispose();
    _educationController.dispose();
    _coursesController.dispose();
    _skillsController.dispose();
    _experiencesController.dispose();
    _languagesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar currículo')),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              SectionCard(
                title: 'Dados pessoais',
                icon: Icons.person_outline,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: _fullNameController,
                      label: 'Nome completo',
                      validator: _required('Informe seu nome completo'),
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      controller: _ageController,
                      label: 'Idade',
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      controller: _emailController,
                      label: 'E-mail',
                      keyboardType: TextInputType.emailAddress,
                      validator: _required('Informe seu e-mail'),
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      controller: _phoneController,
                      label: 'Telefone',
                      keyboardType: TextInputType.phone,
                      validator: _required('Informe seu telefone'),
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      controller: _cityController,
                      label: 'Cidade',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SectionCard(
                title: 'Informações profissionais',
                icon: Icons.work_outline,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: _objectiveController,
                      label: 'Objetivo profissional',
                      maxLines: 3,
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      controller: _educationController,
                      label: 'Formação acadêmica',
                      maxLines: 3,
                      validator: _required('Informe sua formação'),
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      controller: _coursesController,
                      label: 'Cursos complementares',
                      maxLines: 3,
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      controller: _skillsController,
                      label: 'Habilidades',
                      hint: 'Ex.: comunicação, organização, informática básica',
                      maxLines: 3,
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      controller: _experiencesController,
                      label: 'Experiências ou projetos',
                      maxLines: 4,
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      controller: _languagesController,
                      label: 'Idiomas',
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              PrimaryButton(
                label: 'Pré-visualizar currículo',
                icon: Icons.visibility_outlined,
                onPressed: _previewResume,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? Function(String?) _required(String message) {
    return (value) => value == null || value.trim().isEmpty ? message : null;
  }

  void _previewResume() {
    if (!_formKey.currentState!.validate()) return;

    final resume = ResumeModel(
      fullName: _fullNameController.text.trim(),
      age: _ageController.text.trim(),
      email: _emailController.text.trim(),
      phone: _phoneController.text.trim(),
      city: _cityController.text.trim(),
      objective: _objectiveController.text.trim(),
      education: _educationController.text.trim(),
      courses: _coursesController.text.trim(),
      skills: _skillsController.text.trim(),
      experiences: _experiencesController.text.trim(),
      languages: _languagesController.text.trim(),
    );

    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => ResumePreviewPage(resume: resume)),
    );
  }
}
