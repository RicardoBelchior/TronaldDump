import 'package:tronald_dump/data/api.dart';
import 'package:tronald_dump/data/api_mock.dart';
import 'package:tronald_dump/data/api_remote.dart';

enum Flavor { MOCK, PROD }

/// Simple DI
class Injector {
  static final Injector _singleton = Injector._internal();
  static Flavor _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  TronaldRepository get tronaldRepository {
    switch (_flavor) {
      case Flavor.MOCK:
        return TronaldRepositoryMock();
      default:
        return TronaldRepositoryRemote();
    }
  }
}
