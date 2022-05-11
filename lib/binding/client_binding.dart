import 'package:get/get.dart';
import 'package:training_flutter_ui/network/base_client.dart';

class ClientBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BaseClient.instance.client!,
        tag: (BaseClient).toString());
  }
}
