import 'package:flutter_test/flutter_test.dart';

import 'package:landingbigfair/app.dart';

void main() {
  testWidgets('Landing page renders without crashing',
      (WidgetTester tester) async {
    await tester.pumpWidget(const BigfairApp());
    expect(find.text('B1GFAIR'), findsWidgets);
  });
}
