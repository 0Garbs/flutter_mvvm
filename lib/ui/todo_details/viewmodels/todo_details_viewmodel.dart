import 'package:flutter/material.dart';
import 'package:flutter_mvvm/data/repositories/todo/todo_repository.dart';
import 'package:flutter_mvvm/domain/models/todo.dart';
import 'package:flutter_mvvm/utils/commands/command.dart';
import 'package:flutter_mvvm/utils/result/result.dart';

class TodoDetailsViewmodel extends ChangeNotifier {
  final TodoRepository _todoRepository;

  TodoDetailsViewmodel({required TodoRepository todoRepository})
      : _todoRepository = todoRepository {
    load = Command1(_load);
  }

  late final Command1<Todo, String> load;

  late Todo _todo;

  Todo get todo => _todo;

  Future<Result<Todo>> _load(String id) async {
    try {
      final result = await _todoRepository.getById(id);

      switch (result) {
        case Ok<Todo>():
          _todo = result.value;
          return Result.ok(result.value);
        default:
          return result;
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      notifyListeners();
    }
  }
}
