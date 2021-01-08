abstract class ExceptionUtils {
  static bool verifyIfIsException(dynamic _response) {
    if (_response is Exception)
      return true;
    else
      return false;
  }
}
