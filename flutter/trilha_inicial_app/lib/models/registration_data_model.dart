import 'package:hive/hive.dart';

part 'registration_data_model.g.dart';

@HiveType(typeId: 0)
class RegistrationDataModel extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  DateTime? birthday;

  @HiveField(2)
  String? experienceLevel;

  @HiveField(3)
  List<String> languages = [];

  @HiveField(4)
  double? salary;

  @HiveField(5)
  int? experienceTime;

  RegistrationDataModel();

  RegistrationDataModel.blank() {
    name = "";
    birthday = null;
    experienceLevel = "";
    languages = [];
    salary = 0.0;
    experienceTime = 0;
  }
}
