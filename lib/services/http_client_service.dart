import 'package:dio/dio.dart';
import 'package:uk_bank_holidays/config.dart';
import 'package:uk_bank_holidays/services/http_client_interface.dart';

class HttpClientService implements HttpClientInterface {
  final _dio = Dio(BaseOptions(baseUrl: baseUrl));

  @override
  Future get(String path) async {
    final response = await _dio.get(path);
    return response.data;
  }
}
