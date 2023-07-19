import 'env_abstract.dart';

class TestConfig implements BaseConfig {
  @override
  String get apiHost => "";
}

class DevConfig implements BaseConfig {
  @override
  String get apiHost => "";
}

class ChallengeConfig implements BaseConfig {
  @override
  String get apiHost => "";
}

//?BETA
class StagingConfig implements BaseConfig {
  @override
  String get apiHost => "";
}

class ProdConfig implements BaseConfig {
  @override
  String get apiHost => "";
}
