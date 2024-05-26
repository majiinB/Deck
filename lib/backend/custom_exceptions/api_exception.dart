class ApiException implements Exception {
  final int statusCode;
  final String message;

  ApiException(this.statusCode, this.message);

  @override
  String toString() {
    return 'ApiException: $message (Status Code: $statusCode)';
  }
}

class IncompleteRequestBodyException extends ApiException {
  IncompleteRequestBodyException(String message) : super(418, message);
}

class NumberOfCardsException extends ApiException {
  NumberOfCardsException(String message) : super(420, message);
}

class ForbiddenException extends ApiException {
  ForbiddenException(String message) : super(403, message);
}

class NotFoundException extends ApiException {
  NotFoundException(String message) : super(404, message);
}

class InternalServerErrorException extends ApiException {
  InternalServerErrorException(String message) : super(500, message);
}

// Add more exceptions as needed
