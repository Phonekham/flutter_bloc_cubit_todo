import 'package:flutter_bloc_cubit_todo/data/models/todo.dart';
import 'package:flutter_bloc_cubit_todo/data/network_service.dart';

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
}
