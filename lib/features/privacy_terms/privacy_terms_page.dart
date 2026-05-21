import 'package:flutter/material.dart';

import 'privacy_terms_document.dart';

class PrivacyTermsPage extends StatelessWidget {
  const PrivacyTermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Termos de privacidade')),
      body: const SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: PrivacyTermsDocument(),
        ),
      ),
    );
  }
}
