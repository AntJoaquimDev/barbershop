import 'package:barbershop/src/core/constants/local_storage_keys.dart';
import 'package:barbershop/src/core/providers/apllications_providers.dart';
import 'package:barbershop/src/core/ui/helpers/messages.dart';
import 'package:barbershop/src/model/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splash_vm.g.dart';

enum SplashState {
  initial,
  login,
  loggedADM,
  loggedEmploee,
  erro,
}

@riverpod
class SplashVm extends _$SplashVm {
  @override
  Future<SplashState> build() async {
    final sp = await SharedPreferences.getInstance();
    if (sp.containsKey(LocalStorageKeys.accessToken)) {
      ref.invalidate(getMeProvider);
      ref.invalidate(getMyBarbersShopProvider);
      try {
  final userModel = await ref.watch(getMeProvider.future);
  return switch (userModel) {
    UserModelADM() => SplashState.loggedADM,
    UserModelEmployee() => SplashState.loggedEmploee,
  };
}  catch (e) {
  
  SplashState.login;
}
    }
    return SplashState.login;
  }
}
