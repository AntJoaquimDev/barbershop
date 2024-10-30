import 'package:barbershop/src/core/exceptions/auth_exception.dart';
import 'package:barbershop/src/core/exceptions/repository_exception.dart';
import 'package:barbershop/src/core/fp/either.dart';
import 'package:barbershop/src/model/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

abstract class UserRepository {
  FutureOr<Either<AuthException, String>> login(String email, String password);
  FutureOr<Either<RepositoryException, UserModel>> me();
}
