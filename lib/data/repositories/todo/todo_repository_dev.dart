import 'package:flutter_mvvm/utils/result/result.dart';
import 'package:flutter_mvvm/data/repositories/todo/todo_repository.dart';
import 'package:flutter_mvvm/domain/models/todo.dart';

class TodoRepositoryDev implements TodoRepository {
  final _todos = <Todo>[];

  @override
  Future<Result<Todo>> add(String name) async {
    final lastTodoIndex = _todos.length;

    final newTodo = Todo(id: '${lastTodoIndex + 1}', name: name);

    _todos.add(newTodo);

    return Result.ok(newTodo);
  }

  @override
  Future<Result<List<Todo>>> get() async {
    return Result.ok(_todos);
  }

  @override
  Future<Result<void>> remove(Todo todo) async {
    if (_todos.contains(todo)) {
      _todos.remove(todo);
    }

    return Result.ok(null);
  }
}
