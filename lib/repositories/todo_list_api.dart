import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:task_management_app/repositories/todo_list_repository.dart';

import '../models/TodoListModel.dart';

class TodoListAPI extends TodoListRepository {
  late List<TodoListModel> todoListModel;
  var enpoint = "https://todo-list-api-mfchjooefq-as.a.run.app/todo-list";
  @override
  Future<List<TodoListModel>> getAllTodoList() async {
    try {
      var response = await Dio()
          .get('${enpoint}?offset=0&limit=2&sortBy=createdAt&isAsc=true&status=TODO');
      var list = response.data["tasks"] as List;
      todoListModel = list.map((post) => TodoListModel.fromJson(post)).toList();
    } catch (exception) {
      print(exception);
    }
    return todoListModel;
  }
}
