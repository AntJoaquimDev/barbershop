import 'package:barbershop/src/core/restClient/restClient.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'apllications_providers.g.dart';

@Riverpod(keepAlive: true)
RestClient restClient(RestClientRef ref) => RestClient();
