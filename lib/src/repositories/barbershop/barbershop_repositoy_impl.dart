import 'dart:async';
import 'dart:developer';
import 'dart:io';


import 'package:barbershop/src/core/exceptions/repository_exception.dart';
import 'package:barbershop/src/core/fp/either.dart';
import 'package:barbershop/src/core/fp/nil.dart';
import 'package:barbershop/src/core/restClient/restClient.dart';
import 'package:barbershop/src/model/barbershop_model.dart';
import 'package:barbershop/src/model/user_model.dart';
import 'package:dio/dio.dart';

import 'barbershop_repositoy.dart';

class BarnershopRepositoyImpl implements BarbershopRepositoy {
  final RestClient restClient;
  BarnershopRepositoyImpl({
    required this.restClient,
  });
  @override
  Future<Either<RepositoryException, BarbershopModel>> getMyBarbersShop(
      UserModel userModel) async {
    switch (userModel) {
      case UserModelADM():
        final Response(data: List(first: data)) =
            await restClient.auth.get('/barbershop', queryParameters: {
          'user_id':'#userAuthRef' //no manobra pár json resst server no back normal tem q trocar
        });
        return Success(BarbershopModel.fromMap(data));
      case UserModelEmployee():
        final Response(:data) = await restClient.auth.get(
          '/barbershop/${userModel.barberShopId}',
        );
        return Success(BarbershopModel.fromMap(data));
    }
  }

  @override
  Future<Either<RepositoryException, Nil>> save(
      ({
        String email,
        String name,
        List<String> openingDays,
        List<int> openingHours,
      }) dataDTo) async {
    try {
      await restClient.auth.post('/barbershop', data: {
        'user_id': '#userAuthRef',
        'name': dataDTo.name,
        'email': dataDTo.email,
        'opening_days': dataDTo.openingDays,
        'opening_hours': dataDTo.openingHours,
      });
      return Success(nil);

    } on DioException catch (e, s) {
      
      log('Erro ao registar Barbearia', error: e, stackTrace: s);
      return Failure(
          RepositoryException(message: 'Erro ao registar Barbearia'));
    }
  }
}
