import 'package:aibspartenairemobile/screens/AibsWelcomeForLogin.dart';
import 'package:aibspartenairemobile/screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test AibsWelcomeForLogin UI', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: AibsWelcomeForLogin()));

    expect(find.text('votre espace partenaires'), findsOneWidget);
    expect(find.text('Se connecter'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.byType(SvgPicture), findsNWidgets(2));
    expect(find.byType(Column), findsNWidgets(2));
  });

  testWidgets('Test AibsWelcomeForLogin Button Tap', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: AibsWelcomeForLogin()));


    final buttonFinder = find.text('Se connecter');

    expect(buttonFinder, findsOneWidget);

    await tester.tap(buttonFinder);

    await tester.pumpAndSettle();

    expect(find.byType(LoginScreen), findsOneWidget);
  });
}
