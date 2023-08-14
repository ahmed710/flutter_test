import 'package:aibspartenairemobile/screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

void main() {
  testWidgets('Test Login Screen UI', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));
    expect(find.text('BIENVENUE'), findsOneWidget);

    expect(find.byType(FormBuilderTextField), findsNWidgets(2));

    expect(find.byType(FormBuilderCheckbox), findsOneWidget);

    expect(find.text('Se souvenir de moi'), findsOneWidget);

    expect(find.text('CONNEXION'), findsOneWidget);


    expect(find.text('OU'), findsOneWidget);

    expect(find.byType(SvgPicture), findsNWidgets(4));

    expect(find.text("Vous n'avez pas encore de compte ?"), findsOneWidget);

    expect(find.text(" Inscrivez-vous."), findsOneWidget);
  });


  testWidgets('Test Form Validation', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));

    await tester.enterText(find.byKey(ValueKey('email')), 'invalid_email');
    await tester.enterText(find.byKey(ValueKey('password')), 'short');
    await tester.tap(find.text('CONNEXION'));
    await tester.pumpAndSettle();

    expect(find.byType(SnackBar), findsOneWidget);

    expect(
      find.descendant(
        of: find.byType(SnackBar),
        matching: find.text('Veuillez corriger les erreurs dans le formulaire.'),
      ),
      findsOneWidget,
    );

    await tester.enterText(find.byKey(ValueKey('email')), 'validemail@example.com');
    await tester.enterText(find.byKey(ValueKey('password')), 'validpassword');
    await tester.tap(find.text('CONNEXION'));
    await tester.pumpAndSettle();

  });


  testWidgets('Test Checkbox Functionality', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));

    final checkboxFinder = find.byType(FormBuilderCheckbox);

    expect(tester.widget<FormBuilderCheckbox>(checkboxFinder).initialValue, false);

  });

}
