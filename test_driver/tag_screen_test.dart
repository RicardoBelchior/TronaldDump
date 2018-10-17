import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:tronald_dump/data/api_mock.dart';
import 'package:tronald_dump/strings.dart';

void main() {
  group('integration test,', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) driver.close();
    });

    test('verify trending topics title is shown', () async {
      await driver.waitFor(
          find.text(Strings.trending_topics));
    });

    test('open tag screen', () async {
      var tag = TronaldRepositoryMock.tagMoney;
      var expectedQuotes = await TronaldRepositoryMock().getTag(tag);
      var expectedQuoteText = expectedQuotes.first.text;

      await driver.tap(
          find.text(TronaldRepositoryMock.tagMoney));

      await driver.waitFor(
          find.text(expectedQuoteText));
    });
  });
}
