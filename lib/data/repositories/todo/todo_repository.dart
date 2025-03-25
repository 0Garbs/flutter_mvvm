import 'package:flutter_mvvm/core/result/result.dart';
import 'package:flutter_mvvm/domain/models/todo.dart';

abstract class TodoRepository {
  Future<Result<List<Todo>>> get();

  Future<Result<Todo>> add(String name);

  Future<Result<void>> remove(Todo todo);
}
