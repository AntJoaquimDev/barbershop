import 'package:asyncstate/asyncstate.dart';
import 'package:barbershop/src/core/fp/either.dart';
import 'package:barbershop/src/core/providers/apllications_providers.dart';
import 'package:barbershop/src/services/register/user_register_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_register_vm.g.dart';

enum UserRegisterStateStatus {
  initial,
  success,
  error,
}

@riverpod
class UserRegisterVm extends _$UserRegisterVm {
  @override
  UserRegisterStateStatus build() => UserRegisterStateStatus.initial;

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final userRegisterService = ref.watch(userRegisterAdmServicesProvider);

    final userDTO = (
      name: name,
      email: email,
      password: password,
    );
    final registerResult =
        await userRegisterService.execute(userDTO).asyncLoader();
    switch (registerResult) {
      case Success():
        ref.invalidate(getMeProvider);
        state = UserRegisterStateStatus.success;
      case Failure():
        state = UserRegisterStateStatus.error;
    }
  }
}
