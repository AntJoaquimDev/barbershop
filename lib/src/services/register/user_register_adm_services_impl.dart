import 'package:barbershop/src/core/exceptions/service_exception.dart';
import 'package:barbershop/src/core/fp/either.dart';
import 'package:barbershop/src/core/fp/nil.dart';
import 'package:barbershop/src/repositories/user/user_repository.dart';
import 'package:barbershop/src/services/login/user_login_service.dart';

import './user_register_adm_services.dart';

class UserRegisterAdmServicesImpl implements UserRegisterAdmServices {
  final UserRepository userRepository;
  final UserLoginService userLoginService;
  
  UserRegisterAdmServicesImpl({
    required this.userRepository,
    required this.userLoginService,
  });

  @override
  Future<Either<ServiceException, Nil>> execute(
      ({
        String email,        
        String name,
        String password
      }) userDTO) async {
    final registerResult = await userRepository.registerAdmin(userDTO );
    switch (registerResult) {
      case Success():
        return userLoginService.execute(userDTO.email, userDTO.password);
      case Failure(:final exception):
        return Failure(ServiceException(message: exception.message));
    }
  }
}
