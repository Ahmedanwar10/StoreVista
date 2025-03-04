import 'package:dio/dio.dart';
import 'package:store_vista/data/network/Failure.dart';

class ErrorHandler implements Exception {
  final Failure failure;

  ErrorHandler.handle(dynamic error)
      : failure = (error is DioException)
            ? _handleError(error)
            : DataSource.unknown.getFailure();
}

Failure _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return Failure(
          ResponseCodes.requestTimeout, ResponseMessages.requestTimeout);

    case DioExceptionType.badCertificate:
      return Failure(ResponseCodes.unauthorized, ResponseMessages.unauthorized);

    case DioExceptionType.badResponse:
      if (error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return Failure(error.response?.statusCode! ?? 0,
            error.response?.statusMessage! ?? "");
      }
      return DataSource.unknown.getFailure();

    case DioExceptionType.cancel:
      return Failure(
          ResponseCodes.requestCancelled, ResponseMessages.requestCancelled);

    case DioExceptionType.connectionError:
      return Failure(
          ResponseCodes.connectionError, ResponseMessages.connectionError);

    case DioExceptionType.unknown:
    default:
      return DataSource.unknown.getFailure();
  }
}

Failure _handleStatusCode(int? statusCode) {
  switch (statusCode) {
    case ResponseCodes.badRequest:
      return Failure(ResponseCodes.badRequest, ResponseMessages.badRequest);
    case ResponseCodes.unauthorized:
      return Failure(ResponseCodes.unauthorized, ResponseMessages.unauthorized);
    case ResponseCodes.forbidden:
      return Failure(ResponseCodes.forbidden, ResponseMessages.forbidden);
    case ResponseCodes.notFound:
      return Failure(ResponseCodes.notFound, ResponseMessages.notFound);
    case ResponseCodes.methodNotAllowed:
      return Failure(
          ResponseCodes.methodNotAllowed, ResponseMessages.methodNotAllowed);
    case ResponseCodes.requestTimeout:
      return Failure(
          ResponseCodes.requestTimeout, ResponseMessages.requestTimeout);
    case ResponseCodes.tooManyRequests:
      return Failure(
          ResponseCodes.tooManyRequests, ResponseMessages.tooManyRequests);
    case ResponseCodes.internalServerError:
      return Failure(ResponseCodes.internalServerError,
          ResponseMessages.internalServerError);
    case ResponseCodes.notImplemented:
      return Failure(
          ResponseCodes.notImplemented, ResponseMessages.notImplemented);
    case ResponseCodes.badGateway:
      return Failure(ResponseCodes.badGateway, ResponseMessages.badGateway);
    case ResponseCodes.serviceUnavailable:
      return Failure(ResponseCodes.serviceUnavailable,
          ResponseMessages.serviceUnavailable);
    case ResponseCodes.gatewayTimeout:
      return Failure(
          ResponseCodes.gatewayTimeout, ResponseMessages.gatewayTimeout);
    default:
      return DataSource.unknown.getFailure();
  }
}

enum DataSource {
  success,
  badRequest,
  unauthorized,
  forbidden,
  notFound,
  methodNotAllowed,
  requestTimeout,
  tooManyRequests,
  internalServerError,
  notImplemented,
  badGateway,
  serviceUnavailable,
  gatewayTimeout,
  requestCancelled,
  connectionError,
  unknown
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.badRequest:
        return Failure(ResponseCodes.badRequest, ResponseMessages.badRequest);

      case DataSource.unauthorized:
        return Failure(
            ResponseCodes.unauthorized, ResponseMessages.unauthorized);

      case DataSource.forbidden:
        return Failure(ResponseCodes.forbidden, ResponseMessages.forbidden);

      case DataSource.notFound:
        return Failure(ResponseCodes.notFound, ResponseMessages.notFound);

      case DataSource.methodNotAllowed:
        return Failure(
            ResponseCodes.methodNotAllowed, ResponseMessages.methodNotAllowed);

      case DataSource.requestTimeout:
        return Failure(
            ResponseCodes.requestTimeout, ResponseMessages.requestTimeout);

      case DataSource.tooManyRequests:
        return Failure(
            ResponseCodes.tooManyRequests, ResponseMessages.tooManyRequests);

      case DataSource.internalServerError:
        return Failure(ResponseCodes.internalServerError,
            ResponseMessages.internalServerError);

      case DataSource.notImplemented:
        return Failure(
            ResponseCodes.notImplemented, ResponseMessages.notImplemented);

      case DataSource.badGateway:
        return Failure(ResponseCodes.badGateway, ResponseMessages.badGateway);

      case DataSource.serviceUnavailable:
        return Failure(ResponseCodes.serviceUnavailable,
            ResponseMessages.serviceUnavailable);

      case DataSource.gatewayTimeout:
        return Failure(
            ResponseCodes.gatewayTimeout, ResponseMessages.gatewayTimeout);

      case DataSource.requestCancelled:
        return Failure(
            ResponseCodes.requestCancelled, ResponseMessages.requestCancelled);

      case DataSource.connectionError:
        return Failure(
            ResponseCodes.connectionError, ResponseMessages.connectionError);

      case DataSource.success:
        return Failure(ResponseCodes.success, ResponseMessages.success);

      default:
        return Failure(0,
            "Unknown Error - Something unexpected happened.\nخطأ غير معروف، حدث شيء غير متوقع.");
    }
  }
}
class ApiInternet{
  static const int success = 0;
  static const int failure =1;
}

class ResponseCodes {
  static const int success = 200;
  static const int created = 201;
  static const int accepted = 202;
  static const int noContent = 204;

  static const int movedPermanently = 301;
  static const int found = 302;
  static const int notModified = 304;
  static const int temporaryRedirect = 307;

  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int methodNotAllowed = 405;
  static const int requestTimeout = 408;
  static const int tooManyRequests = 429;

  static const int internalServerError = 500;
  static const int notImplemented = 501;
  static const int badGateway = 502;
  static const int serviceUnavailable = 503;
  static const int gatewayTimeout = 504;

  static const int requestCancelled = 0;
  static const int connectionError = 0;
}

class ResponseMessages {
  static const String success =
      "OK - Request was successful.\nتم تنفيذ الطلب بنجاح.";
  static const String badRequest =
      "Bad Request - Invalid request data.\nالطلب غير صحيح بسبب بيانات غير صالحة.";
  static const String unauthorized =
      "Unauthorized - Authentication required.\nغير مصرح لك، يجب تسجيل الدخول.";
  static const String forbidden =
      "Forbidden - Access denied.\nتم رفض الوصول، ليس لديك الصلاحيات.";
  static const String notFound =
      "Not Found - Resource not found.\nالمورد المطلوب غير موجود.";
  static const String methodNotAllowed =
      "Method Not Allowed - HTTP method not allowed.\nالطريقة المستخدمة غير مسموح بها.";
  static const String requestTimeout =
      "Request Timeout - Server took too long to respond.\nانتهت مهلة الطلب.";
  static const String tooManyRequests =
      "Too Many Requests - Slow down requests.\nتم إرسال عدد كبير جدًا من الطلبات.";
  static const String internalServerError =
      "Internal Server Error - Something went wrong.\nخطأ داخلي في الخادم.";
  static const String notImplemented =
      "Not Implemented - Server does not support this.\nالخادم لا يدعم الوظيفة المطلوبة.";
  static const String badGateway =
      "Bad Gateway - Received invalid response.\nاستلم الخادم استجابة غير صالحة.";
  static const String serviceUnavailable =
      "Service Unavailable - Server is overloaded.\nالخادم غير متاح، قد يكون تحت الصيانة.";
  static const String gatewayTimeout =
      "Gateway Timeout - Server took too long.\nانتهت مهلة الاتصال بالخادم.";
  static const String requestCancelled =
      "Request Cancelled - The request was cancelled.\nتم إلغاء الطلب.";
  static const String connectionError =
      "Connection Error - Please check your internet connection.\nخطأ في الاتصال، تحقق من الإنترنت.";
}
