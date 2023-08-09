import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:habhoub/CircularProgressIndicator.dart';

void main() {
  testWidgets('CustomProgressIndicator test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: CustomProgressIndicator(
          lastStepNumber: 0,
          stepNumber: 1,
          totalSteps: 3,
          isSwipedRight: false,
        ),
      ),
    );
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('1 / 3'), findsOneWidget);
  });

  testWidgets('CustomProgressIndicator swipe test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: CustomProgressIndicator(
          lastStepNumber: 0,
          stepNumber: 2,
          totalSteps: 3,
          isSwipedRight: true,
        ),
      ),
    );
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('2 / 3'), findsOneWidget);
  });

  testWidgets('CustomProgressIndicator different total steps test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: CustomProgressIndicator(
          lastStepNumber: 1,
          stepNumber: 2,
          totalSteps: 5,
          isSwipedRight: true,
        ),
      ),
    );
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('2 / 5'), findsOneWidget);
  });
}
