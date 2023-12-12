import 'package:hive/hive.dart';
import 'package:trilha_inicial_app/models/configurations_model.dart';

class ConfigurationsRepository {
  static late Box box;

  ConfigurationsRepository._create();

  static Future<ConfigurationsRepository> load() async {
    if (Hive.isBoxOpen('configurations_box')) {
      box = Hive.box('configurations_box');
    } else {
      box = await Hive.openBox('configurations_box');
    }
    return ConfigurationsRepository._create();
  }

  void save(ConfigurationsModel configurationsModel) {
    box.put('configurationsModel', {
      'username': configurationsModel.username,
      'height': configurationsModel.height,
      'receiveNotification': configurationsModel.receiveNotification,
      'darkTheme': configurationsModel.darkTheme
    });
  }

  ConfigurationsModel getData() {
    var configurations = box.get('configurationsModel');
    if (configurations == null) {
      return ConfigurationsModel.blank();
    }
    return ConfigurationsModel(
        configurations['username'],
        configurations['height'],
        configurations['receiveNotification'],
        configurations['darkTheme']);
  }
}
