import 'package:flutter/material.dart';
import 'package:flutter_mvvm/data/repositories/todo/todo_repository_remote.dart';
import 'package:flutter_mvvm/data/services/api/api_client.dart';
import 'package:flutter_mvvm/ui/todo/viewmodels/todo_viewmodel.dart';
import 'package:flutter_mvvm/ui/todo/widgets/todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      home: TodoScreen(
        todoViewmodel: TodoViewmodel(todosRepository: TodoRepositoryRemote(apiClient: ApiClient(host: '10.0.1.80'))),
      ),
    );
  }
}
