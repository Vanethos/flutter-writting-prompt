import 'dart:async';

// Imports the Flutter Driver API
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:writing_prompt/presentation/styles/strings.dart';

void main() {
  FlutterDriver driver;

  SerializableFinder promptWidget = find.byValueKey(key_prompt_text);

  setUpAll(() async {
    // Connects to the app
    driver = await FlutterDriver.connect();
  });

  tearDownAll(() async {
    if (driver != null) {
      // Closes the connection
      driver.close();
    }
  });

  test('At the beginning we have the empty text string', () async {
    String widgetText = await driver.getText(promptWidget);
    expect(widgetText, emptyPrompt);
  });

  test('After waiting for a time, we get a new message', () async {
    await Future<void>.delayed(Duration(seconds: 10));
    String widgetText = await driver.getText(promptWidget);
    expect(widgetText, isNot(emptyPrompt));
  });

}