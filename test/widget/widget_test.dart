import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:discount/main.dart';

void main() {
  testWidgets('Discount Widget Test - init', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: MyHomePage(title: "Discount Test"),
    ));
    expect(find.text("Discount Test"), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.text("Digite o valor inicial"), findsOneWidget);
    expect(find.text("Digite o valor do desconto"), findsOneWidget);
    expect(find.text("Calcular valor final"), findsOneWidget);
    expect(find.widgetWithText(TextField, "Digite o valor inicial"), findsOneWidget);
    expect(find.widgetWithText(TextField, "Digite o valor do desconto"), findsOneWidget);
    expect(find.widgetWithText(RaisedButton, "Calcular valor final"), findsOneWidget);
    expect(find.byType(RaisedButton), findsOneWidget);
  });

  testWidgets('Discount Widget Test - calculate discount null', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: MyHomePage(title: "Discount Test"),
    ));

    await tester.tap(find.byType(RaisedButton));
    await tester.pump();

    expect(find.text("Os dois valores devem estar digitados corretamente"), findsOneWidget);
  });

  testWidgets('Discount Widget Test - calculate invalid', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: MyHomePage(title: "Discount Test"),
    ));

    await tester.enterText(find.byKey(Key('initValue')), 'ab');
    await tester.enterText(find.byKey(Key('discountValue')), 'ab');
    await tester.tap(find.byType(RaisedButton));
    await tester.pump();

    expect(find.text("Os dois valores devem estar digitados corretamente"), findsOneWidget);
  });

  testWidgets('Discount Widget Test - calculate wrong', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: MyHomePage(title: "Discount Test"),
    ));

    await tester.enterText(find.byKey(Key('initValue')), '10');
    await tester.enterText(find.byKey(Key('discountValue')), '20');
    await tester.tap(find.byType(RaisedButton));
    await tester.pump();

    expect(find.text("O desconto não pode ser maior do que o valor inicial"), findsOneWidget);
  });

  testWidgets('Discount Widget Test - calculate', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: MyHomePage(title: "Discount Test"),
    ));

    await tester.enterText(find.byKey(Key('initValue')), '20');
    await tester.enterText(find.byKey(Key('discountValue')), '10');
    await tester.tap(find.byType(RaisedButton));
    await tester.pump();

    expect(find.text("O valor final é 10.00"), findsOneWidget);
  });
}
