
import 'package:flutter/material.dart';

class GlobalKeyNav {
  static GlobalKeyNav? _instance;
  final navKey=GlobalKey<NavigatorState>();
  // Avoid self instance
  GlobalKeyNav._();

  static GlobalKeyNav get instance =>
    _instance ??= GlobalKeyNav._();
}





/*class GlobalContext {
  //!ATENÇÃO NUNCA DEIXA A O NAVIGATOR COMO PUBLICO!!!
  
  static GlobalContext? _instance;

  GlobalContext._();
  static GlobalContext get inst {
    _instance ??= GlobalContext._();
    return _instance!;
  }

  set navigatorKey(GlobalKey<NavigatorState> key) => _navigatorKey = key;

  Future<void> loginExpire() async {
    final sp = await SharedPreferences.getInstance();
    sp.clear();
    showTopSnackBar(
        _navigatorKey.currentState!.overlay!,
        const CustomSnackBar.error(
          message: 'Login expirado clique na sacola novamnete',
          backgroundColor: Colors.black,
        ));
    _navigatorKey.currentState!.popUntil(ModalRoute.withName('/home'));
  }
}
 */