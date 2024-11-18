import 'package:barbershop/src/core/exceptions/repository_exception.dart';
import 'package:barbershop/src/core/fp/either.dart';
import 'package:barbershop/src/core/fp/nil.dart';
import 'package:barbershop/src/model/barbershop_model.dart';
import 'package:barbershop/src/model/user_model.dart';

abstract interface class BarbershopRepositoy {
  Future<Either<RepositoryException, BarbershopModel>> getMyBarbersShop(
      UserModel userModel);
  Future<Either<RepositoryException, Nil>> save(
    ({String name,
    String email,
    List<String> openingDays,
    List<int> openingHours,})data
  );
}
