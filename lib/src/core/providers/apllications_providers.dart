import 'package:barbershop/src/core/fp/either.dart';
import 'package:barbershop/src/core/restClient/restClient.dart';
import 'package:barbershop/src/model/barbershop_model.dart';
import 'package:barbershop/src/model/user_model.dart';
import 'package:barbershop/src/repositories/barbershop_repositoy.dart';
import 'package:barbershop/src/repositories/barbershop_repositoy_impl.dart';
import 'package:barbershop/src/repositories/user/user_repository.dart';
import 'package:barbershop/src/repositories/user/user_repository_impl.dart';
import 'package:barbershop/src/services/user_login_adm_service.dart';
import 'package:barbershop/src/services/user_login_adm_service_impl.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'apllications_providers.g.dart';

@Riverpod(keepAlive: true)
RestClient restClient(RestClientRef ref) => RestClient();

@Riverpod(keepAlive: true)
UserRepository userRepository(UserRepositoryRef ref) =>
    UserRepositoryImpl(restClient: ref.read(restClientProvider));
@Riverpod(keepAlive: true)
UserLoginService userLoginService(UserLoginServiceRef ref) =>
    UserLoginServiceImpl(userRepository: ref.read(userRepositoryProvider));

@Riverpod(keepAlive: true)
Future<UserModel> getMe(GetMeRef ref) async {
  final result = await ref.watch(userRepositoryProvider).me();

  return switch (result) {
    Success(value: final userModel) => userModel,
    Failure(:final exception) => throw exception,
  };
}

@Riverpod(keepAlive: true)
BarbershopRepositoy barbershopRepositoy(BarbershopRepositoyRef ref) =>
    BarnershopRepositoyImpl(restClient: ref.watch(restClientProvider));

@Riverpod(keepAlive: true)
Future<BarbershopModel> getMyBarbersShop(GetMyBarbersShopRef ref) async {
  final userModel = await ref.watch(getMeProvider.future);

  final barbershopRepositoy = ref.watch(barbershopRepositoyProvider);
  final result = await barbershopRepositoy.getMyBarbersShop(userModel);

  return switch (result) {
    Success(value: final barbershop) => barbershop,
    Failure(:final exception) => throw exception,
  };
}
