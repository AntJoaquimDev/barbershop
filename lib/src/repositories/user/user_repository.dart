import 'package:barbershop/src/core/exceptions/auth_exception.dart';
import 'package:barbershop/src/core/exceptions/repository_exception.dart';
import 'package:barbershop/src/core/fp/either.dart';
import 'package:barbershop/src/core/fp/nil.dart';
import 'package:barbershop/src/model/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

abstract class UserRepository {
  Future<Either<AuthException, String>> login(String email, String password);
  Future<Either<RepositoryException, UserModel>> me();
  Future<Either<RepositoryException, Nil>> registerAdmin(
    ({
      String id,
      String name,
      String email,
      String password,
    }) userData,
  );
}
