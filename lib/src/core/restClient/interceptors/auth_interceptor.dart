import 'package:barbershop/src/core/constants/local_storage_keys.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final RequestOptions(:headers, :extra) = options;

    const authHeaderKey = 'Authorization';
    headers.remove(authHeaderKey);

    if (extra case {'DIO_AUTH_KEY': true}) {
      final sp = await SharedPreferences.getInstance();
      headers.addAll(
         { authHeaderKey: 'Bearer ${sp.getString(LocalStorageKeys.accessToken)}'});
    }
    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Redirecionar o usuario para tela Home
      // GlobalContext.inst.loginExpire();
      final sp = await SharedPreferences.getInstance();
      sp.clear();
      handler.next(err);
    } else {
      handler.next(err);
    }
  }
}