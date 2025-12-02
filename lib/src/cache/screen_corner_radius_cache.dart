import 'package:screen_corner_radius/screen_corner_radius.dart';

// ignore: avoid_classes_with_only_static_members
class ScreenCornerRadiusCache {
  static double? _value;

  static Future<double?> get() async {
    if (_value != null) {
      return _value;
    }
    try {
      _value = (await ScreenCornerRadius.get())?.bottomLeft;
    } catch (err) {
      _value = 0;
    }
    return _value;
  }

  static void clear() {
    _value = null;
  }
}
