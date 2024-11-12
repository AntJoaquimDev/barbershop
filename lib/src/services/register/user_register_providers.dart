import 'package:barbershop/src/core/providers/apllications_providers.dart';
import 'package:barbershop/src/services/register/user_register_adm_services.dart';
import 'package:barbershop/src/services/register/user_register_adm_services_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_register_providers.g.dart';

@riverpod
 UserRegisterAdmServices userRegisterAdmServices(UserRegisterAdmServicesRef ref)=>
 UserRegisterAdmServicesImpl(userRepository: ref.watch(userRepositoryProvider), 
 userLoginService: ref.watch(userLoginServiceProvider));