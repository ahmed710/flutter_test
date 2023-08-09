import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:habhoub/StepWidgetSecond.dart';

void main() {
  testWidgets('StepWidgetSecond test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: StepWidgetSecond(
          lastStepNumber: 1,
          stepNumber: 2,
          totalSteps: 3,
          isSwipedRight: true,
        ),
      ),
    );

    expect(find.text('La Deuxième étape'), findsOneWidget);
    expect(find.text('Informations Client'), findsOneWidget);
    expect(find.byType(FormBuilderTextField), findsNWidgets(5));
    expect(find.byType(ElevatedButton), findsOneWidget);

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    expect(find.text("Veuillez corriger les erreurs dans le formulaire."), findsOneWidget);
  });

}
