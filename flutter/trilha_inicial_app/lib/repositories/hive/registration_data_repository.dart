import 'package:hive/hive.dart';
import 'package:trilha_inicial_app/models/registration_data_model.dart';

class RegistrationDataRepository {
  static late Box _box;

  RegistrationDataRepository._create();

  static Future<RegistrationDataRepository> load() async {
    if (Hive.isBoxOpen('registrationDataModel')) {
      _box = Hive.box('registrationDataModel');
    } else {
      _box = await Hive.openBox('registrationDataModel');
    }
    return RegistrationDataRepository._create();
  }

  void save(RegistrationDataModel registrationDataModel) {
    _box.put('registrationDataModel', registrationDataModel);
  }

  RegistrationDataModel getData() {
    var registrationDataModel = _box.get('registrationDataModel');
    if (registrationDataModel == null) {
      return RegistrationDataModel.blank();
    } else {
      return registrationDataModel;
    }
  }
}
