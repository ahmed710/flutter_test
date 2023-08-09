import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:habhoub/StepWidgetThird.dart'; // Import your StepWidgetThird class

void main() {
  testWidgets('StepWidgetThird test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: StepWidgetThird(
            lastStepNumber: 2,
            stepNumber: 3,
            totalSteps: 3,
            isSwipedRight: true,
          ),
        ),
      ),
    );

    expect(find.text('La troisième étape'), findsOneWidget);
    expect(find.text('Ajouter Un Document'), findsNothing);
    expect(find.text('Télécharger Votre Document'), findsOneWidget);

    await tester.tap(find.text('Importez Votre Fichier'));
    await tester.pumpAndSettle();

  });
}
