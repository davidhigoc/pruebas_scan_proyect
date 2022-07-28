import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pru_scan_project/main.dart';

void main() {
  group("WidgetHome", () {
    testWidgets("Home", (WidgetTester tester) async {
      // ? Busqueda de widgets
      final sigButton = find.byKey(const ValueKey("signatureButton"));

      // ? La ejecución de pruebas
      await tester.pumpWidget(const MyApp());

      await tester.enterText(sigButton, "Testing button");
      // await tester.tap(sigButton);
      // await tester.pump(); // Se reconstruye el widget

      // ? CHECK DE SALIDAS
      // expect(find.text("Testing button"), findsOneWidget);
    });
  });
}
