import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tronald_dump/data/api_mock.dart';
import 'package:tronald_dump/injection/dependency_injection.dart';
import 'package:tronald_dump/main_screen/TagsWidget.dart';
import 'package:tronald_dump/strings.dart';

void main() {
  Injector.configure(Flavor.MOCK);

  testWidgets('tags widget test', (WidgetTester tester) async {

    await tester.pumpWidget(_prepareWidget(TagsWidget()));
    expect(find.text(Strings.loading), findsOneWidget);

    await tester.pump();
    expect(find.text(TronaldRepositoryMock.tagMoney), findsOneWidget);
    expect(find.text(TronaldRepositoryMock.tagHillary), findsOneWidget);
    expect(find.text("not-a-tag"), findsNothing);
  });
}

Widget _prepareWidget(Widget widgetUnderTest) {
  return MaterialApp(
    title: 'App under test',
    home: Scaffold(
      appBar: AppBar(title: Text("Test")),
      body: widgetUnderTest,
    ),
  );
}
