import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:habhoub/CircularProgressIndicator.dart';
import 'package:habhoub/StepWidgetFirst.dart';
import 'package:habhoub/Stepper.dart';

void main() {

  testWidgets('StepWidgetFirst test', (WidgetTester tester) async {
    final professionelController = ButtonController();
    final insuranceTypeController = ButtonController();

    await tester.pumpWidget(
      MaterialApp(
        home: StepWidgetFirst(
          lastStepNumber: 0,
          stepNumber: 1,
          totalSteps: 3,
          handleProfessionelButtonTap: professionelController,
          insuranceTypeButtonController: insuranceTypeController,
          isSwipedRight: false,
        ),
      ),
    );

    expect(find.text('La Première étape'), findsOneWidget);
    expect(find.text('Sélectionner Votre Choix'), findsNWidgets(2));
    expect(find.text('Professionel'), findsOneWidget);
    expect(find.text('Particulier'), findsOneWidget);
    expect(find.text('Auto'), findsOneWidget);
    expect(find.text('Habitation'), findsOneWidget);
    expect(find.text('Moto / Scooter'), findsOneWidget);
    expect(find.text('Santé'), findsOneWidget);
    expect(find.byType(CustomProgressIndicator), findsOneWidget);

    await tester.tap(find.text('Professionel'));
    await tester.pumpAndSettle();

    expect(
      find.widgetWithText(ElevatedButton, 'Professionel'),
      findsOneWidget,
    );

    final professionelButton =
    find.widgetWithText(ElevatedButton, 'Professionel').evaluate().single.widget as ElevatedButton;
    final backgroundColor = professionelButton.style?.backgroundColor?.resolve({MaterialState.selected});
    expect(backgroundColor, Color(0xFF00082B));
  });


  testWidgets('StepWidgetFirst swipe right test', (WidgetTester tester) async {
    final professionelController = ButtonController();
    final insuranceTypeController = ButtonController();

    await tester.pumpWidget(
      MaterialApp(
        home: StepWidgetFirst(
          lastStepNumber: 0,
          stepNumber: 2,
          totalSteps: 3,
          handleProfessionelButtonTap: professionelController,
          insuranceTypeButtonController: insuranceTypeController,
          isSwipedRight: true,
        ),
      ),
    );

    expect(find.text('La Première étape'), findsOneWidget);
    expect(find.text('Sélectionner Votre Choix'), findsNWidgets(2));
    expect(find.text('Professionel'), findsOneWidget);
    expect(find.text('Particulier'), findsOneWidget);
    expect(find.text('Auto'), findsOneWidget);
    expect(find.text('Habitation'), findsOneWidget);
    expect(find.text('Moto / Scooter'), findsOneWidget);
    expect(find.text('Santé'), findsOneWidget);
    expect(find.byType(CustomProgressIndicator), findsOneWidget);
  });
}
