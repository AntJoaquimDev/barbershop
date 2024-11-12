import 'package:asyncstate/asyncstate.dart';
import 'package:barbershop/src/core/exceptions/service_exception.dart';
import 'package:barbershop/src/core/fp/either.dart';
import 'package:barbershop/src/core/providers/apllications_providers.dart';
import 'package:barbershop/src/features/auth/login/login_state.dart';
import 'package:barbershop/src/model/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_vm.g.dart';

@riverpod
class LoginVm extends _$LoginVm {
  @override
  LoginState build() => LoginState.initial();
  Future<void> login(String email, String password) async {
    final loaderHandle = AsyncLoaderHandler()..start();
    final loginServive = ref.watch(userLoginServiceProvider);

    final result = await loginServive.execute(email, password);

    switch (result) {
      case Success():
      //! invalidar o cache para evitar login de user errado;
        ref.invalidate(getMeProvider);
        ref.invalidate(getMyBarbersShopProvider);
          //buscar dados do user logado
        final userModel = await ref.read(getMeProvider.future);

        switch (userModel) { 
          //analizar qual tipo de login (ADM ou Employee)
          case UserModelADM():
            state = state.copyWith(status: LoginStateStatus.admLogin);
           
          case UserModelEmployee():
            state = state.copyWith(status: LoginStateStatus.employeeLogin);
           
        }

      case Failure(exception: ServiceException(:final message)):
        state = state.copyWith(
          status: LoginStateStatus.error,
          errorMessage: () => message,
        );
    }
    loaderHandle.close();
  }
}
