import 'package:http/http.dart';

class BaseClient {
  static BaseClient instance = BaseClient._();

  Client? client;

  factory BaseClient() {
    return instance;
  }

  BaseClient._() {
    client = client ?? Client();
  }
}
