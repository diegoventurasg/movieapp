import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'dio_service.dart';

class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    String token = dotenv.env['TOKEN']!;
    return Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/4/',
        headers: {
          'content-type': 'application/json;charset=utf-8',
          'authorization': 'Bearer $token',
        },
      ),
    );
  }
}
