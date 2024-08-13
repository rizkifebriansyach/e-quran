import 'package:equran_app/utils/env/config_data.dart';
import 'package:equran_app/utils/env/env.dart';

enum Environment {
  PRODUCTION,
  STAGING,
  DEVELOPMENT,
}

class AppEnv {
  static Config config = Config(baseUrl: EnvConfig.baseUrl);
  static Environment env = Environment.DEVELOPMENT;

  static set(Environment environment) {
    env = environment;
    switch (environment) {
      case Environment.PRODUCTION:
        config = Config(baseUrl: EnvConfig.baseUrl);
        break;
      case Environment.STAGING:
        config = Config(baseUrl: EnvConfig.baseUrl);
        break;
      case Environment.DEVELOPMENT:
        config = Config(baseUrl: EnvConfig.baseUrl);  
        break;
    }
  }
}
