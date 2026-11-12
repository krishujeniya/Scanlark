import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  testWidgets('QR content renders in a Material app', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: QrImageView(data: 'snaptext-ci-smoke', size: 180),
        ),
      ),
    );

    expect(find.byType(QrImageView), findsOneWidget);
  });
}
