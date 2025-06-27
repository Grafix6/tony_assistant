import 'package:android_intent/android_intent.dart';

class DeviceControl {
  // Call number
  static void callNumber(String number) {
    AndroidIntent intent = AndroidIntent(
      action: 'android.intent.action.CALL',
      data: 'tel:$number',
    );
    intent.launch();
  }

  // Open app by package name
  static void openApp(String packageName) {
    AndroidIntent intent = AndroidIntent(
      action: 'action_main',
      package: packageName,
    );
    intent.launch();
  }
}