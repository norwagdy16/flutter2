import 'package:dio/dio.dart';
import 'package:flutter_application_2/models/todos_model.dart';

class TodosServices {
  String url = "https://jsonplaceholder.typicode.com/todos";

  Future<List<Welcome>> getTodosData() async {
    List<Welcome> todosList = [];
    final dio = Dio();
    final response = await dio.get(url);
    var data = response.data;
    data.forEach((jsonElement) {
      Welcome todo = Welcome.fromJson(jsonElement);
      todosList.add(todo);
    });
    return todosList;
  }
}
