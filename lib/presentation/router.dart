import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit_todo/constants/strings.dart';
import 'package:flutter_bloc_cubit_todo/cubit/add_todo_cubit.dart';
import 'package:flutter_bloc_cubit_todo/cubit/edit_todo_cubit.dart';
import 'package:flutter_bloc_cubit_todo/cubit/todos_cubit.dart';
import 'package:flutter_bloc_cubit_todo/data/models/todo.dart';
import 'package:flutter_bloc_cubit_todo/data/network_service.dart';
import 'package:flutter_bloc_cubit_todo/data/repository.dart';
import 'package:flutter_bloc_cubit_todo/presentation/screens/add_todo_screen.dart';
import 'package:flutter_bloc_cubit_todo/presentation/screens/edit_todo_screen.dart';
import 'package:flutter_bloc_cubit_todo/presentation/screens/todo_screen.dart';

class AppRouter {
  late Repository repository;
  late TodosCubit todosCubit;

  AppRouter() {
    repository = Repository(NetworkService());
    todosCubit = TodosCubit(repository: repository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: todosCubit,
                  child: const TodoScreen(),
                ));
      case ADD_TODO_ROUTE:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => AddTodoCubit(
                      repository: repository, todosCubit: todosCubit),
                  child: AddTodoScreen(),
                ));
      case EDIT_TODO_ROUTE:
        final todo = settings.arguments as Todo;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => EditTodoCubit(
                      repository: repository, todosCubit: todosCubit),
                  child: EditTodoScreen(
                    todo: todo,
                  ),
                ));
      default:
        return null;
    }
  }
}
