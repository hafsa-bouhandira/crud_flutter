import 'package:dio/dio.dart';

//import 'contact.dart';

class PatientsApi {
  final _dio = Dio(BaseOptions(baseUrl: 'http://127.0.0.1:80/users'));

  Future<List> getContacts() async {
    print("*******1");
    final response = await _dio.get('');
    print("*******2");
    print(response.data);
    print("*******3");
    return (response.data);
  }
}
