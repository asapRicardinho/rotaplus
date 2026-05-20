import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rota_plus/app.dart';

void main() {
  testWidgets('shows home page and opens vocational test', (tester) async {
    await tester.pumpWidget(const RotaPlusApp());

    expect(find.text('Rota+'), findsWidgets);
    expect(find.text('Seu caminho para o primeiro currículo.'), findsOneWidget);

    await tester.tap(find.widgetWithText(ElevatedButton, 'Teste vocacional'));
    await tester.pumpAndSettle();

    expect(find.text('Teste vocacional'), findsOneWidget);
    expect(
      find.text('1. Com qual tipo de atividade você mais se identifica?'),
      findsOneWidget,
    );
  });

  testWidgets('opens credits page', (tester) async {
    await tester.pumpWidget(const RotaPlusApp());

    final creditsButton = find.widgetWithText(ElevatedButton, 'Créditos');
    await tester.ensureVisible(creditsButton);
    await tester.tap(creditsButton);
    await tester.pumpAndSettle();

    expect(find.text('Créditos'), findsOneWidget);
    expect(find.text('Desenvolvimento de Software'), findsOneWidget);
    expect(find.text('Prof. Dr. Elvio Gilberto da Silva'), findsOneWidget);
    expect(find.text('Ricardo Mazzo do Nascimento'), findsOneWidget);
    expect(find.text('Felipe Saggioro Pinhatar'), findsOneWidget);
    expect(find.text('Felipe Turini'), findsOneWidget);
  });

  testWidgets('opens privacy terms page', (tester) async {
    await tester.pumpWidget(const RotaPlusApp());

    final privacyTermsButton = find.widgetWithText(
      ElevatedButton,
      'Termos de privacidade',
    );
    await tester.ensureVisible(privacyTermsButton);
    await tester.tap(privacyTermsButton);
    await tester.pumpAndSettle();

    expect(find.text('Termos de privacidade'), findsOneWidget);
  });
}
