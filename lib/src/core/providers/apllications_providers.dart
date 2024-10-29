import 'package:barbershop/src/core/restClient/restClient.dart';
import 'package:barbershop/src/repositories/user/user_repository.dart';
import 'package:barbershop/src/repositories/user/user_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'apllications_providers.g.dart';

@Riverpod(keepAlive: true)
RestClient restClient(RestClientRef ref) => RestClient();

@Riverpod(keepAlive:true)
UserRepository userRepository(UserRepositoryRef ref)=>UserRepositoryImpl(restClient: ref.read(restClientProvider));