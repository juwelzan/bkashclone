sealed class AppExceptions implements Exception {
  final String message;

  const AppExceptions({required this.message});
}

class NetworkException extends AppExceptions {
  const NetworkException([String message = "Network problem"])
    : super(message: message);
}

class ServerException extends AppExceptions {
  final String statusCode;
  const ServerException({required super.message, required this.statusCode});
}
