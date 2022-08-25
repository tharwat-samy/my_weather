class ServerException implements Exception {
  final String errMessage;

  ServerException(this.errMessage);
}
