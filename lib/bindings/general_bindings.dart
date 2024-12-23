import 'package:apptofiretorasbpi/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

import '../data/repositories/authentication/authentication_repository.dart';

class GeneralBindings extends Bindings{
  @override
  void dependencies(){
    Get.put(NetworkManager());
    Get.put(AuthenticationRepository());
  }
}