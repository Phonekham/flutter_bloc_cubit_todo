import 'package:flutter/material.dart';
import 'package:flutter_bloc_cubit_todo/presentation/router.dart';
import 'package:flutter_bloc_cubit_todo/presentation/screens/todo_screen.dart';

void main() {
  runApp(TodoApp(
    router: AppRouter(),
  ));
}

class TodoApp extends StatelessWidget {
  final AppRouter router;
  const TodoApp({Key? key, required this.router}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: false,
      onGenerateRoute: router.generateRoute,
    );
  }
}
