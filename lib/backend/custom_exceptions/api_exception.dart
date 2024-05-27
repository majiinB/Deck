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

class TextExtractionException extends ApiException {
  TextExtractionException(String message) : super(421, message);
}

class FileDeletionError extends ApiException {
  FileDeletionError(String message) : super(422, message);
}

class InternalServerErrorException extends ApiException {
  InternalServerErrorException(String message) : super(500, message);
}

// Add more exceptions as needed
