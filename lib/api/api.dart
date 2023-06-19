import 'package:dio/dio.dart';
import 'package:estudosalura/api/model/api_model.dart';
import 'package:estudosalura/database/local_database.dart';

class Api {
  Future<List<User>> fetchUser() async {
    final dio = Dio();

    final response =
        await dio.get('https://jsonplaceholder.typicode.com/posts');

    if (response.statusCode == 200) {
      final jsonData = response.data as List<dynamic>;
      final users =
          jsonData.map((userJson) => User.fromJson(userJson)).toList();

      for (final user in users) {
        await DataBaseHelper.instance.insertUser(user);
      }

      return users;
    } else {
      throw Exception('Falha ao carregar os usuários');
    }
  }
}
