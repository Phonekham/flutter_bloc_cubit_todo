import 'package:flutter_bloc_cubit_todo/data/models/todo.dart';
import 'package:flutter_bloc_cubit_todo/data/network_service.dart';
import 'package:http/http.dart';

class Repository {
  final NetworkService networkService;

  Repository(this.networkService);

  Future<List<Todo>> fetchTodos() async {
    final todoRaw = await networkService.fetchTodos();
    return todoRaw!.map((e) => Todo.fromJson(e)).toList();
  }

  Future<bool> changeComplettion(bool isCompleted, int id) async {
    final patchObj = {"isCompleted": isCompleted.toString()};
    return await networkService.patchTodo(patchObj, id);
  }

  Future<Todo> addTodo(String message) async {
    final todoObj = {'todo': message, 'isCompleted': "false"};
    final todoMap = await networkService.addTodo(todoObj);
    return Todo.fromJson(todoMap!);
  }
}
