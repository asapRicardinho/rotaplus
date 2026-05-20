import 'package:flutter/material.dart';

import '../../shared/widgets/primary_button.dart';
import '../../shared/widgets/section_card.dart';
import '../resume_builder/resume_form_page.dart';

class VocationalResultPage extends StatelessWidget {
  const VocationalResultPage({required this.area, super.key});

  final String area;

  static const Map<String, AreaResult> _results = {
    'Tecnologia': AreaResult(
      description:
          'Boa opção para quem gosta de resolver problemas, aprender ferramentas digitais e criar soluções práticas.',
      professions: [
        'Desenvolvedor(a) júnior',
        'Suporte técnico',
        'Analista de dados iniciante',
        'Técnico(a) de informática',
      ],
      skills: ['Lógica', 'Organização', 'Curiosidade', 'Inglês básico'],
    ),
    'Administração': AreaResult(
      description:
          'Combina com perfis organizados, responsáveis e interessados em processos, atendimento e resultados.',
      professions: [
        'Auxiliar administrativo',
        'Assistente comercial',
        'Recepcionista',
        'Jovem aprendiz administrativo',
      ],
      skills: [
        'Comunicação',
        'Planejamento',
        'Excel básico',
        'Responsabilidade',
      ],
    ),
    'Comunicação': AreaResult(
      description:
          'Indicada para quem gosta de se expressar, criar conteúdos e conectar pessoas por meio de mensagens claras.',
      professions: [
        'Assistente de marketing',
        'Social media iniciante',
        'Atendimento ao cliente',
        'Produtor(a) de conteúdo',
      ],
      skills: ['Escrita', 'Criatividade', 'Oratória', 'Escuta ativa'],
    ),
    'Saúde': AreaResult(
      description:
          'Faz sentido para quem tem empatia, atenção aos detalhes e interesse em cuidar ou orientar pessoas.',
      professions: [
        'Atendente de clínica',
        'Auxiliar de saúde bucal',
        'Cuidador(a)',
        'Recepcionista hospitalar',
      ],
      skills: ['Empatia', 'Paciência', 'Atenção', 'Trabalho em equipe'],
    ),
    'Design': AreaResult(
      description:
          'Combina com pessoas criativas que gostam de transformar ideias em soluções visuais úteis e bonitas.',
      professions: [
        'Designer gráfico iniciante',
        'Assistente de criação',
        'Editor(a) de imagens',
        'Designer de mídias sociais',
      ],
      skills: [
        'Criatividade',
        'Senso visual',
        'Pesquisa',
        'Atenção a detalhes',
      ],
    ),
    'Educação': AreaResult(
      description:
          'Boa direção para quem gosta de explicar, apoiar colegas e contribuir para o aprendizado de outras pessoas.',
      professions: [
        'Monitor(a)',
        'Auxiliar de classe',
        'Tutor(a)',
        'Instrutor(a) de cursos livres',
      ],
      skills: ['Didática', 'Paciência', 'Comunicação', 'Organização'],
    ),
  };

  @override
  Widget build(BuildContext context) {
    final result = _results[area]!;

    return Scaffold(
      appBar: AppBar(title: const Text('Resultado vocacional')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              'Área mais compatível',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(area, style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 18),
            SectionCard(title: 'Sobre a área', child: Text(result.description)),
            const SizedBox(height: 16),
            SectionCard(
              title: 'Possíveis profissões',
              child: _BulletList(items: result.professions),
            ),
            const SizedBox(height: 16),
            SectionCard(
              title: 'Habilidades recomendadas',
              child: _BulletList(items: result.skills),
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              label: 'Criar currículo',
              icon: Icons.description_outlined,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const ResumeFormPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AreaResult {
  const AreaResult({
    required this.description,
    required this.professions,
    required this.skills,
  });

  final String description;
  final List<String> professions;
  final List<String> skills;
}

class _BulletList extends StatelessWidget {
  const _BulletList({required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text('• $item'),
            ),
          )
          .toList(),
    );
  }
}
