// ignore_for_file: unnecessary_getters_setters

class ConfigurationsModel {
  String _username = "";
  double _height = 0.0;
  bool _receiveNotification = false;
  bool _darkTheme = false;

  ConfigurationsModel.blank() {
    _username = "";
    _height = 0.0;
    _receiveNotification = false;
    _darkTheme = false;
  }

  ConfigurationsModel(
      this._username, this._height, this._receiveNotification, this._darkTheme);

  String get username => _username;

  set username(String username) {
    _username = username;
  }

  double get height => _height;

  set height(double height) {
    _height = height;
  }

  bool get receiveNotification => _receiveNotification;

  set receiveNotification(bool receiveNotification) {
    _receiveNotification = receiveNotification;
  }

  bool get darkTheme => _darkTheme;

  set darkTheme(bool darkTheme) {
    _darkTheme = darkTheme;
  }
}
