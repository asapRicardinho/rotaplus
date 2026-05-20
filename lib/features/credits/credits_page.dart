import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../shared/widgets/section_card.dart';

class CreditsPage extends StatelessWidget {
  const CreditsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Créditos')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: const [
            SectionCard(
              title: 'Informações acadêmicas',
              icon: Icons.school_outlined,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _CreditLine(
                    label: 'Disciplina',
                    value: 'Desenvolvimento de Software',
                  ),
                  SizedBox(height: 12),
                  _CreditLine(
                    label: 'Professor',
                    value: 'Prof. Dr. Elvio Gilberto da Silva',
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SectionCard(
              title: 'Equipe',
              icon: Icons.groups_outlined,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _TeamMember(name: 'Ricardo Mazzo do Nascimento'),
                  _TeamMember(name: 'Felipe Saggioro Pinhatar'),
                  _TeamMember(name: 'Felipe Jeske Turini'),
                ],
              ),
            ),
            SizedBox(height: 20),
            _AssetImagesGallery(),
          ],
        ),
      ),
    );
  }
}

class _CreditLine extends StatelessWidget {
  const _CreditLine({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 3),
        Text(value),
      ],
    );
  }
}

class _TeamMember extends StatelessWidget {
  const _TeamMember({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(Icons.person_outline, size: 20, color: colorScheme.secondary),
          const SizedBox(width: 8),
          Expanded(child: Text(name)),
        ],
      ),
    );
  }
}

class _AssetImagesGallery extends StatelessWidget {
  const _AssetImagesGallery();

  static const _imageExtensions = ['.png', '.jpg', '.jpeg', '.webp'];
  static const _ignoredAssets = ['assets/icons/rota_plus_icon_source.png'];
  static const _imageTitles = ['Desenvolvimento', 'Apoio'];

  Future<List<String>> _loadImageAssets() async {
    final manifest = await AssetManifest.loadFromAssetBundle(rootBundle);
    final assets =
        manifest
            .listAssets()
            .where(
              (asset) =>
                  asset.startsWith('assets/') &&
                  !_ignoredAssets.contains(asset) &&
                  _imageExtensions.any(
                    (extension) => asset.toLowerCase().endsWith(extension),
                  ),
            )
            .toList()
          ..sort();

    return assets;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: _loadImageAssets(),
      builder: (context, snapshot) {
        final assets = snapshot.data ?? const <String>[];

        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }

        if (assets.isEmpty) {
          return const Text(
            'Adicione imagens na pasta assets para exibi-las aqui.',
          );
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            final crossAxisCount = constraints.maxWidth >= 520 ? 3 : 2;

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: assets.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final asset = assets[index];
                final title = index < _imageTitles.length
                    ? _imageTitles[index]
                    : null;

                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color(0xFFE3E8EF)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        if (title != null) ...[
                          Text(
                            title,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 8),
                        ],
                        Expanded(
                          child: Image.asset(asset, fit: BoxFit.contain),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
