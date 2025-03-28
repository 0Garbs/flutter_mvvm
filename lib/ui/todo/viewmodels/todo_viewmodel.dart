import 'package:flutter/material.dart';
import 'package:flutter_mvvm/utils/commands/command.dart';
import 'package:flutter_mvvm/utils/result/result.dart';
import 'package:flutter_mvvm/data/repositories/todo/todo_repository.dart';
import 'package:flutter_mvvm/domain/models/todo.dart';

class TodoViewmodel extends ChangeNotifier {
  TodoViewmodel({required TodoRepository todosRepository})
      : _todosRepository = todosRepository {
    load = Command0(_load)..execute();
    addTodo = Command1(_addTodo);
    removeTodo = Command1(_removeTodo);
    updateTodo = Command1(_updateTodo);
  }

  final TodoRepository _todosRepository;

  late Command0 load;
  late Command1<Todo, (String, String, bool)> addTodo;
  late Command1<void, Todo> removeTodo;
  late Command1<Todo, Todo> updateTodo;

  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  Future<Result> _load() async {
    final result = await _todosRepository.get();

    switch (result) {
      case Ok<List<Todo>>():
        _todos = [
          ...result.value
        ]; //! Spread operator is needed to don't share the same reference
        notifyListeners();
        break;
      case Error():
        //TODO: Implement Error
        break;
    }

    return result;
  }

  Future<Result<Todo>> _addTodo((String, String, bool) todo) async {
    final (name, description, done) = todo;

    final result = await _todosRepository.add(
      name: name,
      description: description,
      done: done,
    );

    switch (result) {
      case Ok<Todo>():
        _todos.add(result.value);
        notifyListeners();
        break;
      case Error():
        //TODO: Implement Error
        break;
    }

    return result;
  }

  Future<Result<void>> _removeTodo(Todo todo) async {
    final result = await _todosRepository.remove(todo);

    switch (result) {
      case Ok<void>():
        _todos.remove(todo);
        notifyListeners();
        break;
      case Error():
        //TODO: Implement Error
        break;
    }

    return result;
  }

  Future<Result<Todo>> _updateTodo(Todo todo) async {
    final result = await _todosRepository.update(todo);

    switch (result) {
      case Ok<Todo>():
        final index = _todos.indexWhere((e) => e.id == todo.id);
        _todos[index] = todo;
        notifyListeners();
        break;
      case Error():
        //TODO: Implement Error
        break;
    }

    return result;
  }
}
