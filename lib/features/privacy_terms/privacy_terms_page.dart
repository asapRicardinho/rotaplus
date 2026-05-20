import 'package:flutter/material.dart';

class PrivacyTermsPage extends StatelessWidget {
  const PrivacyTermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Termos de privacidade')),
      body: const SafeArea(child: SizedBox.shrink()),
    );
  }
}
