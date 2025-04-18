import 'package:flutter_mvvm/utils/result/result.dart';
import 'package:flutter_mvvm/domain/models/todo.dart';

abstract class TodoRepository {
  Future<Result<List<Todo>>> get();

  Future<Result<Todo>> add({
    required String name,
    required String description,
    required bool done,
  });

  Future<Result<void>> remove(Todo todo);

  Future<Result<Todo>> getById(String id);

  Future<Result<Todo>> update(Todo todo);
}
