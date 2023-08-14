import 'package:aibspartenairemobile/screens/Register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

void main() {
  testWidgets('Test Login Screen UI', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Register()));
    expect(find.text('BIENVENUE'), findsOneWidget);

    expect(find.byType(FormBuilderTextField), findsNWidgets(3));

    expect(find.text("S'INSCRIRE"), findsOneWidget);

    expect(find.text('OU'), findsOneWidget);

    expect(find.byType(SvgPicture), findsNWidgets(4));

    expect(find.text("Avez-vous déja un compte ?"), findsOneWidget);

    expect(find.text(" Connectez-vous."), findsOneWidget);
  });


  testWidgets('Test Form Validation', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Register()));
    await tester.enterText(find.byKey(ValueKey('nom')), 'invalid_name');
    await tester.enterText(find.byKey(ValueKey('email')), 'invalid_email');
    await tester.enterText(find.byKey(ValueKey('password')), 'short');
    await tester.tap(find.text("S'INSCRIRE"));
    await tester.pumpAndSettle();

    expect(find.byType(SnackBar), findsOneWidget);

    expect(
      find.descendant(
        of: find.byType(SnackBar),
        matching: find.text('Veuillez corriger les erreurs dans le formulaire.'),
      ),
      findsOneWidget,
    );
    await tester.enterText(find.byKey(ValueKey('nom')), 'invalid_name');
    await tester.enterText(find.byKey(ValueKey('email')), 'validemail@example.com');
    await tester.enterText(find.byKey(ValueKey('password')), 'validpassword');
    await tester.tap(find.text("S'INSCRIRE"));
    await tester.pumpAndSettle();

  });

}
