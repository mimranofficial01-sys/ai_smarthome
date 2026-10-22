import 'package:flutter_test/flutter_test.dart';
import 'package:ai_smart_home_design/app/app/app.dart';

void main() {
  testWidgets('AI Smart Home Design app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());

    // Verify that our app starts and displays the splash/title correctly.
    expect(find.text('AI Smart Home Design'), findsOneWidget);
  });
}
