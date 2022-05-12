import 'package:get/get.dart';
import 'package:training_flutter_ui/network/base_client.dart';
import 'package:training_flutter_ui/network/movie_network.dart';

class ClientBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BaseClient.instance, tag: (BaseClient).toString());
    Get.lazyPut(() => MovieNetworkImpl(Get.find<BaseClient>().client!));
  }
}
