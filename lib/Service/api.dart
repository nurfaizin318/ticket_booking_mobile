import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Melakukan konfigurasi untuk mengirim bearer token pada setiap permintaan
        String bearerToken = "YOUR_BEARER_TOKEN"; // Ganti dengan token Anda
        options.headers["Authorization"] = "Bearer $bearerToken";
        return handler.next(options);
      },
      // Anda juga bisa menambahkan interceptors lainnya sesuai kebutuhan
      onResponse: (response, handler) {
        // Lakukan sesuatu setelah menerima respons dari server
        return handler.next(response);
      },
      onError: (error, handler) {
        // Tangani error jika terjadi
        return handler.next(error);
      },
    ));
  }

  Future<Response> get(String endpoint) async {
    try {
      Response response = await _dio.get(endpoint);
      return response;
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  // Anda dapat menambahkan metode lain untuk metode HTTP lainnya seperti POST, PUT, dll.
}