import 'package:shared_preferences/shared_preferences.dart';

class SessionController {
  final SharedPreferences _sharedPreferences;
  late bool _isSignedIn;

  SessionController(this._sharedPreferences) {
    _isSignedIn = _sharedPreferences.getBool('session') ?? false;
  }

  bool get isSignedIn => _isSignedIn;

  void setSignedIn(bool value) {
    _isSignedIn = value;
    _sharedPreferences.setBool('session', value);
  }
}
