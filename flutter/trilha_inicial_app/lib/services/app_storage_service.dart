import 'package:shared_preferences/shared_preferences.dart';

// ignore_for_file: constant_identifier_names
enum StorageKeys {
  REGISTRATION_DATA_NAME_KEY,
  REGISTRATION_DATA_BIRTHDAY_KEY,
  REGISTRATION_DATA_EXPERIENCE_LEVEL_KEY,
  REGISTRATION_DATA_LANGUAGES_KEY,
  REGISTRATION_DATA_EXPERIENCE_TIME_KEY,
  REGISTRATION_DATA_SALARY_KEY
}

class AppStorageService {
  SharedPreferences? storage;

  void initStorage() async {
    storage = await SharedPreferences.getInstance();
  }

  AppStorageService() {
    initStorage();
  }

  void setRegistrationDataName(String name) async {
    _setString(StorageKeys.REGISTRATION_DATA_NAME_KEY.toString(), name);
  }

  Future<String> getRegistrationDataName() async {
    return _getString(StorageKeys.REGISTRATION_DATA_NAME_KEY.toString());
  }

  void setRegistrationDataBirthday(DateTime birthday) async {
    _setString(StorageKeys.REGISTRATION_DATA_BIRTHDAY_KEY.toString(),
        birthday.toIso8601String());
  }

  Future<DateTime> getRegistrationDataBirthday() async {
    return DateTime.tryParse(await _getString(
            StorageKeys.REGISTRATION_DATA_BIRTHDAY_KEY.toString())) ??
        DateTime.now();
  }

  void setRegistrationDataExperienceLevel(String level) async {
    _setString(
        StorageKeys.REGISTRATION_DATA_EXPERIENCE_LEVEL_KEY.toString(), level);
  }

  Future<String> getRegistrationDataExperienceLevel() async {
    return _getString(
        StorageKeys.REGISTRATION_DATA_EXPERIENCE_LEVEL_KEY.toString());
  }

  void setRegistrationDataLanguages(List<String> languages) async {
    _setStringList(
        StorageKeys.REGISTRATION_DATA_LANGUAGES_KEY.toString(), languages);
  }

  Future<List<String>> getRegistrationDataLanguages() async {
    return _getStringList(
        StorageKeys.REGISTRATION_DATA_LANGUAGES_KEY.toString());
  }

  void setRegistrationDataExperienceTime(int experienceTime) async {
    _setInt(StorageKeys.REGISTRATION_DATA_EXPERIENCE_TIME_KEY.toString(),
        experienceTime);
  }

  Future<int> getRegistrationDataExperienceTime() async {
    return _getInt(
        StorageKeys.REGISTRATION_DATA_EXPERIENCE_TIME_KEY.toString());
  }

  void setRegistrationDataSalary(double chosenSalary) async {
    _setDouble(
        StorageKeys.REGISTRATION_DATA_SALARY_KEY.toString(), chosenSalary);
  }

  Future<double> getRegistrationDataSalary() async {
    return _getDouble(StorageKeys.REGISTRATION_DATA_SALARY_KEY.toString());
  }

  void _setString(String key, String value) async {
    await storage!.setString(key, value);
  }

  Future<String> _getString(String key) async {
    return storage!.getString(key) ?? "";
  }

  void _setStringList(String key, List<String> values) async {
    await storage!.setStringList(key, values);
  }

  Future<List<String>> _getStringList(String key) async {
    return storage!.getStringList(key) ?? [];
  }

  void _setInt(String key, int value) async {
    await storage!.setInt(key, value);
  }

  Future<int> _getInt(String key) async {
    return storage!.getInt(key) ?? 0;
  }

  void _setDouble(String key, double value) async {
    await storage!.setDouble(key, value);
  }

  Future<double> _getDouble(String key) async {
    return storage!.getDouble(key) ?? 0.0;
  }

  void _setBool(String key, bool value) async {
    await storage!.setBool(key, value);
  }

  Future<bool> _getBoll(String key) async {
    return storage!.getBool(key) ?? false;
  }
}
