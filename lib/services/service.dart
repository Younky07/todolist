import 'package:dio/dio.dart';

import '../model/modelUser.dart';

class ListUsersService {
  Dio dio = Dio();
  Future<List<ListUserModel>?> getDataUsers() async {
    String url = "https://reqres.in/api/users?page=2";
    final Response response;

    try {
      response = await dio.get(url);

      print(response.data);
      if (response.statusCode == 200) {
        var json = response.data;
        if (json is Map && json.keys.contains('data')) {
          var data = json['data'];
          if (data is List) {
            dynamic send = data
                .map<ListUserModel>((u) => ListUserModel.fromJson(u))
                .toList();

            return (send);
          }
        }
      }
      return null;
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      throw Exception(error.response);
    }
  }

  Future<bool?> postLogin(String username, String password) async {
    String url = "https://reqres.in/api/login";
    final Response response;

    // ini kayaknya penyebabnya..
    // FormData formData = FormData.fromMap(
    //   {
    //     "name": username,
    //     "job": password,
    //   },
    // );

    try {
      // boleh langsung di buat di sini
      response =
          await dio.post(url, data: {"email": username, "password": password});

      // cek dulu, dionya berhasil atau mengeluarkan error
      if (response.statusCode == 200) {
        // kalau kodenya 200 berarti aman

        // kembalikan true kalau aman
        return true;
      } else {
        // jika ada kesalahan
        throw false;
      }
    } on DioError catch (error, stacktrace) {
      // ketika dio error
      print('Exception occured: $error stackTrace: $stacktrace');
      throw Exception(error.response);
    }
  }
}
