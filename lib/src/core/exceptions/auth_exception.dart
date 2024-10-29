sealed class AuthException implements Exception {
  final String message;
  AuthException({required this.message});
}

class AuthError extends AuthException {
  AuthError({required super.message});
}

class AuthUnauthorizedException extends AuthException {
  AuthUnauthorizedException(String s):super(message: ' E-mail ou Senha inválidos.');
  
}
