import 'package:shared_preferences/shared_preferences.dart';

// ignore_for_file: constant_identifier_names
enum StorageKeys {
  REGISTRATION_DATA_NAME_KEY,
  REGISTRATION_DATA_BIRTHDAY_KEY,
  REGISTRATION_DATA_EXPERIENCE_LEVEL_KEY,
  REGISTRATION_DATA_LANGUAGES_KEY,
  REGISTRATION_DATA_EXPERIENCE_TIME_KEY,
  REGISTRATION_DATA_SALARY_KEY,
  CONFIGURATION_USERNAME_KEY,
  CONFIGURATION_HEIGHT_KEY,
  CONFIGURATION_RECEIVE_NOTIFICATION_KEY,
  CONFIGURATION_DARK_THEME_KEY,
  RANDOM_NUMBER_RANDOM_NUMBER_KEY,
  RANDOM_NUMBER_CLICK_COUNTER_KEY
}

class AppStorageService {
  SharedPreferences? storage;

  AppStorageService(this.storage);

  Future<bool> setRegistrationDataName(String name) async {
    return _setString(StorageKeys.REGISTRATION_DATA_NAME_KEY.toString(), name);
  }

  String getRegistrationDataName() {
    return _getString(StorageKeys.REGISTRATION_DATA_NAME_KEY.toString());
  }

  Future<bool> setRegistrationDataBirthday(DateTime birthday) async {
    return _setString(StorageKeys.REGISTRATION_DATA_BIRTHDAY_KEY.toString(),
        birthday.toIso8601String());
  }

  DateTime getRegistrationDataBirthday() {
    return DateTime.tryParse(_getString(
            StorageKeys.REGISTRATION_DATA_BIRTHDAY_KEY.toString())) ??
        DateTime.now();
  }

  Future<bool> setRandomNumber(int randomNumber) {
    return _setInt(
        StorageKeys.RANDOM_NUMBER_RANDOM_NUMBER_KEY.toString(), randomNumber);
  }

  int getRandomNumber() {
    return _getInt(StorageKeys.RANDOM_NUMBER_RANDOM_NUMBER_KEY.toString());
  }

  Future<bool> setClickCounter(int clickCount) {
    return _setInt(
        StorageKeys.RANDOM_NUMBER_CLICK_COUNTER_KEY.toString(), clickCount);
  }

  int getClickCounter() {
    return _getInt(StorageKeys.RANDOM_NUMBER_CLICK_COUNTER_KEY.toString());
  }

  // generatedNumber = storage.getInt(RANDOM_NUMBER_KEY) ?? 0;
  //     clickCounter = storage.getInt(CLICK_COUNTER_KEY) ?? 0;

  Future<bool> setRegistrationDataExperienceLevel(String level) async {
    return _setString(
        StorageKeys.REGISTRATION_DATA_EXPERIENCE_LEVEL_KEY.toString(), level);
  }

  String getRegistrationDataExperienceLevel() {
    return _getString(
        StorageKeys.REGISTRATION_DATA_EXPERIENCE_LEVEL_KEY.toString());
  }

  Future<bool> setRegistrationDataLanguages(List<String> languages) async {
    return _setStringList(
        StorageKeys.REGISTRATION_DATA_LANGUAGES_KEY.toString(), languages);
  }

  List<String> getRegistrationDataLanguages() {
    return _getStringList(
        StorageKeys.REGISTRATION_DATA_LANGUAGES_KEY.toString());
  }

  Future<bool> setRegistrationDataExperienceTime(int experienceTime) async {
    return _setInt(StorageKeys.REGISTRATION_DATA_EXPERIENCE_TIME_KEY.toString(),
        experienceTime);
  }

  int getRegistrationDataExperienceTime() {
    return _getInt(
        StorageKeys.REGISTRATION_DATA_EXPERIENCE_TIME_KEY.toString());
  }

  Future<bool> setRegistrationDataSalary(double chosenSalary) async {
    return _setDouble(
        StorageKeys.REGISTRATION_DATA_SALARY_KEY.toString(), chosenSalary);
  }

  double getRegistrationDataSalary() {
    return _getDouble(StorageKeys.REGISTRATION_DATA_SALARY_KEY.toString());
  }

  Future<bool> setConfigurationUsername(String username) async {
    return _setString(
        StorageKeys.CONFIGURATION_USERNAME_KEY.toString(), username);
  }

  String getConfigurationUsername() {
    return _getString(StorageKeys.CONFIGURATION_USERNAME_KEY.toString());
  }

  Future<bool> setConfigurationHeight(double height) async {
    return _setDouble(StorageKeys.CONFIGURATION_HEIGHT_KEY.toString(), height);
  }

  double getConfigurationHeight() {
    return _getDouble(StorageKeys.CONFIGURATION_HEIGHT_KEY.toString());
  }

  Future<bool> setConfigurationReceiveNotification(
      bool receivePushNotification) async {
    return _setBool(
        StorageKeys.CONFIGURATION_RECEIVE_NOTIFICATION_KEY.toString(),
        receivePushNotification);
  }

  bool getConfigurationReceiveNotification() {
    return _getBoll(
        StorageKeys.CONFIGURATION_RECEIVE_NOTIFICATION_KEY.toString());
  }

  Future<bool> setConfigurationDarkTheme(bool darkTheme) async {
    return _setBool(
        StorageKeys.CONFIGURATION_DARK_THEME_KEY.toString(), darkTheme);
  }

  bool getConfigurationDarkTheme() {
    return _getBoll(StorageKeys.CONFIGURATION_DARK_THEME_KEY.toString());
  }

  Future<bool> _setString(String key, String value) async {
    return storage!.setString(key, value);
  }

  String _getString(String key) {
    return storage!.getString(key) ?? "";
  }

  Future<bool> _setStringList(String key, List<String> values) async {
    return storage!.setStringList(key, values);
  }

  List<String> _getStringList(String key) {
    return storage!.getStringList(key) ?? [];
  }

  Future<bool> _setInt(String key, int value) async {
    return storage!.setInt(key, value);
  }

  int _getInt(String key) {
    return storage!.getInt(key) ?? 0;
  }

  Future<bool> _setDouble(String key, double value) async {
    return storage!.setDouble(key, value);
  }

  double _getDouble(String key) {
    return storage!.getDouble(key) ?? 0.0;
  }

  Future<bool> _setBool(String key, bool value) async {
    return storage!.setBool(key, value);
  }

  bool _getBoll(String key) {
    return storage!.getBool(key) ?? false;
  }
}
