import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter_application_1/data/models/http_model.dart';

abstract class _HttpBaseProvider {
  final Map<String, String> _headers = HttpPropertiesProvider.headers;

  /// Instancia Dio _HttpBaseProvider
  final Dio dio;
  final bool isTest;

  _HttpBaseProvider({required this.dio, required this.isTest});

  Map<String, String> _headerCompose(RequestBaseModel request) =>
      {..._headers, ...request.headers};

  String _urlCompose(RequestBaseModel request) {
    String evironmentDomain = '';
    String domain = '';

    if (isTest) {
      domain = request.domain;
    } else {
      evironmentDomain = request.domain;
      domain = evironmentDomain;
    }

    String url = domain + request.endpoint + request.urlParam;

    return url;
  }

  /// ## GET
  ///
  /// Es un `Future` que recibe un modelo `RequestBaseModel` como parámetro
  /// y retorna un `Response` de la librería Dio.
  ///
  /// Este método inyecta un interceptor a la instancia de DIO para hacer 6
  /// intentos con un tiempo de espera de 1 segundo entre intentos fallidos.
  Future<Response> get(RequestBaseModel request) async {
    dio.interceptors.add(RetryInterceptor(
      dio: dio,
      logPrint: print,
      retries: 6,
      retryDelays:
          List<Duration>.generate(5, (index) => Duration(seconds: index + 1)),
    ));

    return await dio.get(
      _urlCompose(request),
      queryParameters: request.queryParameters,
      options: Options(headers: _headerCompose(request)),
    );
  }

  /// ## POST
  ///
  /// Es un `Future` que recibe un modelo `RequestBaseModel` como parámetro
  /// y retorna un `Response` de la librería Dio.
  ///
  /// Ejemplo:
  ///
  /// ```dart
  /// //Integración REST
  /// Future<int> save(RequestBaseModel request,[Dio? dio]) async {
  ///   Response response = await HttpServiceProvider(dio).post(request);
  ///   return response.statusCode;
  /// }
  ///
  /// // Llamada
  /// int value = await save(dataRequest);
  ///
  /// // Test
  /// int value = await save(dataMock, dioMock);
  ///
  /// ```
  Future<Response> post(RequestBaseModel request) async => await dio.post(
        _urlCompose(request),
        data: request.body,
        queryParameters: request.queryParameters,
        options: Options(headers: _headerCompose(request)),
      );

  /// ## PUT
  ///
  /// Es un `Future` que recibe un modelo `RequestBaseModel` como parámetro
  /// y retorna un `Response` de la librería Dio.
  ///
  /// Ejemplo:
  ///
  /// ```dart
  /// //Integración REST
  /// Future<int> update(RequestBaseModel request,[Dio? dio]) async {
  ///   Response response = await HttpServiceProvider(dio).put(request);
  ///   return response.statusCode;
  /// }
  ///
  /// // Llamada
  /// int value = await update(dataRequest);
  ///
  /// // Test
  /// int value = await update(dataMock, dioMock);
  ///
  /// ```
  ///
  /// El parámetro `dio` debe establecerse como opcional para cargarlo
  /// en los `test`.
  Future<Response> put(RequestBaseModel request) async => await dio.put(
        _urlCompose(request),
        data: request.body,
        queryParameters: request.queryParameters,
        options: Options(headers: _headerCompose(request)),
      );

  /// ## DELETE
  /// Es un `Future` que recibe un modelo `RequestBaseModel` como parámetro
  /// y retorna un `Response` de la librería Dio.
  ///
  /// Ejemplo:
  ///
  /// ```dart
  /// //Integración REST
  /// Future<int> erase(RequestBaseModel request,[Dio? dio]) async {
  ///   Response response = await HttpServiceProvider(dio).delete(request);
  ///   return response.statusCode;
  /// }
  ///
  /// // Llamada
  /// int value = await erase(dataRequest);
  ///
  /// // Test
  /// int value = await erase(dataMock, dioMock);
  ///
  /// ```
  ///
  Future<Response> delete(RequestBaseModel request) async => await dio.delete(
        _urlCompose(request),
        options: Options(headers: _headerCompose(request)),
      );
}

/// Clase con los métodos base de integración REST Full
/// (get, post, put y delete).
/// Todos devuelven un objeto Response de la librería Dio.
///
/// El parámetro `Dio? dio` es para recibir un cliente Personalizado para un
/// propósito específico o un Mock desde un Test unitario.
class HttpServiceProvider extends _HttpBaseProvider {
  HttpServiceProvider([Dio? dio])
      : super(
          dio: dio ?? Dio(),
          isTest: (dio != null) ? true : false,
        );

  Future<List<int>> getBytes(String url) async {
    Response<List<int>> response = await dio.get<List<int>>(url,
        options: Options(responseType: ResponseType.bytes));
    return response.data ?? [];
  }

  Future<Response> getImage(String url) async => await dio.get(url);
}

class HttpPropertiesProvider {
  static final Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };
}

/// ## Clase serializable
///
/// Todos sus métodos internos retornan un casting genérico T
/// cuando la respuesta es correcta, o un null en caso de ocurrir un error.
///
/// El parámetro `Dio? dio` es para recibir un cliente Personalizado para un
/// propósito específico o un Mock desde un Test unitario.
///
/// > **NOTA:** En todos los métodos de esta clase, si el `response.statusCode`
/// > está entre `200` y `299` devuelve el `response.data` casteado a `T`,
/// > de lo contrario retornará un `null`.
///
class HttpSerializableProvider<T> {
  final HttpServiceProvider _http;

  HttpSerializableProvider(Dio? dio) : _http = HttpServiceProvider(dio);

  /// ## GET (Serializable)
  ///
  /// Retorna el `response.data` de la petición.
  ///
  /// El valor cargado en `response.data`, se puede castear antes
  /// de retornar cuando especifica en el genérico `T` de la clase
  /// Ejemplo:
  ///
  /// ```dart
  /// // List
  /// List<dynamic>? response =
  ///   await HttpSerializableProvider<List<dynamic>>(dio).get(request)
  ///   ?? [];
  ///
  /// // Map
  /// <Map<String, dynamic>> response =
  ///   await HttpSerializableProvider<Map<String, dynamic>>(dio).get(request)
  ///   ?? {}
  /// ```
  Future<T?> get(RequestBaseModel request) async =>
      await _service(type: 'GET', request: _http.get(request));

  /// ## POST (Serializable)
  ///
  /// Retorna el `response.data` de la petición.
  ///
  /// El valor cargado en `response.data`, se puede castear antes
  /// de retornar cuando especifica en el genérico `T` de la clase
  /// Ejemplo:
  ///
  /// ```dart
  /// // List
  /// List<dynamic>? response =
  ///   await HttpSerializableProvider<List<dynamic>>(dio).post(request)
  ///   ?? [];
  ///
  /// // Map
  /// <Map<String, dynamic>> response =
  ///   await HttpSerializableProvider<Map<String, dynamic>>(dio).post(request)
  ///   ?? {}
  /// ```
  Future<T?> post(RequestBaseModel request) async =>
      await _service(type: 'POST', request: _http.post(request));

  /// ## PUT (Serializable)
  ///
  /// Retorna el `response.data` de la petición.
  ///
  /// El valor cargado en `response.data`, se puede castear antes
  /// de retornar cuando especifica en el genérico `T` de la clase
  /// Ejemplo:
  ///
  /// ```dart
  /// // List
  /// List<dynamic>? response =
  ///   await HttpSerializableProvider<List<dynamic>>(dio).put(request)
  ///   ?? [];
  ///
  /// // Map
  /// <Map<String, dynamic>> response =
  ///   await HttpSerializableProvider<Map<String, dynamic>>(dio).put(request)
  ///   ?? {}
  /// ```
  Future<T?> put(RequestBaseModel request) async =>
      await _service(type: 'PUT', request: _http.put(request));

  /// ## DELETE (Serializable)
  ///
  /// Retorna el `response.data` de la petición.
  ///
  /// El valor cargado en `response.data`, se puede castear antes
  /// de retornar cuando especifica en el genérico `T` de la clase
  /// Ejemplo:
  ///
  /// ```dart
  /// // List
  /// List<dynamic>? response =
  ///   await HttpSerializableProvider<List<dynamic>>(dio).delete(request)
  ///   ?? [];
  ///
  /// // Map
  /// <Map<String, dynamic>> response =
  ///   await HttpSerializableProvider<Map<String, dynamic>>(dio).delete(request)
  ///   ?? {}
  /// ```
  Future<T?> delete(RequestBaseModel request) async =>
      await _service(type: 'DELETE', request: _http.delete(request));

  Future<T?> _service(
      {required String type, required Future<Response> request}) async {
    try {
      Response response = await request;

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! <= 299) {
        return response.data as T;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("Http provider error message: " + e.toString());
      return null;
    }
  }

  void debugPrint(String s) {}
}
