import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:indicator_navbar/indicator_navbar.dart';

void main() {
  const MethodChannel channel = MethodChannel('indicator_navbar');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  // test('getPlatformVersion', () async {
  //   expect(await IndicatorNavbar.platformVersion, '42');
  // });
}
