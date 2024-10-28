import 'package:barbershop/src/core/restClient/interceptors/auth_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

final class RestClient extends DioForNative {
  late final AuthInterceptor _authInterceptor;
  RestClient()
      : super(BaseOptions(
          baseUrl: 'http://192.168.3.62:8081',
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 60),
        )) {
    interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
    ));
  }

  RestClient get auth{
    options.extra['DIO_AUTH_KEY'];
    return this;
  }
  RestClient get unAuth{
    options.extra['DIO_AUTH_KEY'];
    return this;
  }
  //  RestClient auth() {
  //   interceptors.add(_authInterceptor);
  //   return this;
  // }

  // RestClient unuauth() {
  //   interceptors.remove(_authInterceptor);
  //   return this;
  // }
}
