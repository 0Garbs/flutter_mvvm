import 'package:flutter/material.dart';
import 'package:flutter_mvvm/core/commands/command.dart';
import 'package:flutter_mvvm/core/result/result.dart';
import 'package:flutter_mvvm/domain/models/todo.dart';

class TodoViewmodel extends ChangeNotifier {
  TodoViewmodel() {
    load = Command0(_load)..execute();
    addTodo = Command1(_addTodo);
    removeTodo = Command1(_removeTodo);
  }

  late Command0 load;
  late Command1<Todo, String> addTodo;
  late Command1<String, Todo> removeTodo;

  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  Future<Result> _load() async {
    await Future.delayed(const Duration(seconds: 1));
    final todos = <Todo>[];

    _todos = todos;

    notifyListeners();

    // return Result.ok(todos..add(Todo(id: 1, name: 'Todo 1'))); //? Render 1 item in View
    // return Result.error(Exception('An error occurred'));       //? Render error in View
    return Result.ok(todos);
  }

  Future<Result<Todo>> _addTodo(String name) async {
    final lastTodoIndex = _todos.length;

    final createdTodo = Todo(id: lastTodoIndex + 1, name: name);

    _todos.add(createdTodo);

    notifyListeners();

    return Result.ok(createdTodo);
  }

  Future<Result<String>> _removeTodo(Todo todo) async {
    await Future.delayed(const Duration(seconds: 1));

    _todos.remove(todo);

    notifyListeners();

    return Result.ok('Todo removed successfully');
  }
}
