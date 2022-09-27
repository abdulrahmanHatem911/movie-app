import 'package:film/core/network/error_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;
  ServerException({
    required this.errorMessageModel,
  });
}

class LocalDataBaseException implements Exception {
  final String errorMessage;
  LocalDataBaseException({
    required this.errorMessage,
  });
}
