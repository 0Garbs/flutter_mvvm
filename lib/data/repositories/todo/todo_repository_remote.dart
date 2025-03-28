import 'package:flutter_mvvm/data/repositories/todo/todo_repository.dart';
import 'package:flutter_mvvm/data/services/api/api_client.dart';
import 'package:flutter_mvvm/data/services/api/models/todo/todo_api_model.dart';
import 'package:flutter_mvvm/domain/models/todo.dart';
import 'package:flutter_mvvm/utils/result/result.dart';

class TodoRepositoryRemote implements TodoRepository {
  final ApiClient _apiClient;

  const TodoRepositoryRemote({required ApiClient apiClient})
      : _apiClient = apiClient;

  @override
  Future<Result<Todo>> add({
    required String name,
    required String description,
    required bool done,
  }) async {
    try {
      final result = await _apiClient.postTodo(CreateTodoApiModel(name: name));

      switch (result) {
        case Ok<Todo>():
          return result;
        default:
          return result;
      }
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<List<Todo>>> get() async {
    final result = await _apiClient.getTodos();

    try {
      switch (result) {
        case Ok<List<Todo>>():
          return result;
        default:
          return result;
      }
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<void>> remove(Todo todo) async {
    try {
      final result = await _apiClient.deleteTodo(todo);

      switch (result) {
        case Ok<void>():
          return result;
        default:
          return result;
      }
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  @override
  Future<Result<Todo>> getById(String id) async {
    try {
      final result = await _apiClient.getTodoById(id);

      switch (result) {
        case Ok<Todo>():
          return result;
        default:
          return result;
      }
    } on Exception catch (error) {
      return Result.error(error);
    }
  }
}
