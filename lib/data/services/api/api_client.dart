import 'dart:convert';
import 'dart:io';

import 'package:flutter_mvvm/data/services/api/models/todo/todo_api_model.dart';
import 'package:flutter_mvvm/domain/models/todo.dart';
import 'package:flutter_mvvm/utils/result/result.dart';

class ApiClient {
  ApiClient({String? host, int? port, HttpClient Function()? clientHttpFactory})
      : _host = host ?? 'localhost',
        _port = port ?? 3000,
        _clientHttpFactory = clientHttpFactory ?? HttpClient.new;

  final String _host;
  final int _port;
  final HttpClient Function() _clientHttpFactory;

  Future<Result<List<Todo>>> getTodos() async {
    final client = _clientHttpFactory();

    try {
      final request = await client.get(_host, _port, '/todos');

      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final json = jsonDecode(stringData) as List;
        final List<Todo> todos = json.map((e) => Todo.fromJson(e)).toList();
        return Result.ok(todos);
      }

      return Result.error(const HttpException('Invalid response'));
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<Todo>> postTodo(TodoApiModel todo) async {
    final client = _clientHttpFactory;

    try {
      final request = await client().post(_host, _port, '/todos');
      request.write(jsonEncode(todo.toJson()));

      final response = await request.close();

      if (response.statusCode == 201) {
        final stringData = await response.transform(utf8.decoder).join();
        final json = jsonDecode(stringData) as Map<String, dynamic>;
        final Todo createdTodo = Todo.fromJson(json);
        return Result.ok(createdTodo);
      }

      return Result.error(const HttpException('Invalid response'));
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client().close();
    }
  }

  Future<Result<Todo>> updateTodo(UpdateTodoApiModel todo) async {
    final client = _clientHttpFactory;

    try {
      final request = await client().put(_host, _port, '/todos/${todo.id}');
      request.write(jsonEncode(todo.toJson()));

      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final json = jsonDecode(stringData) as Map<String, dynamic>;
        final Todo createdTodo = Todo.fromJson(json);
        return Result.ok(createdTodo);
      }

      return Result.error(const HttpException('Invalid response'));
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client().close();
    }
  }

  Future<Result<void>> deleteTodo(Todo todo) async {
    final client = _clientHttpFactory;

    try {
      final request = await client().delete(_host, _port, '/todos/${todo.id}');
      final response = await request.close();

      if (response.statusCode == 200) {
        return Result.ok(null);
      }
      return Result.error(const HttpException('Invalid response'));
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client().close();
    }
  }

  Future<Result<Todo>> getTodoById(String id) async {
    final client = _clientHttpFactory;

    try {
      final request = await client().get(_host, _port, '/todos/$id');
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final json = jsonDecode(stringData) as Map<String, dynamic>;
        final Todo createdTodo = Todo.fromJson(json);
        return Result.ok(createdTodo);
      }

      return Result.error(const HttpException('Invalid response'));
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client().close();
    }
  }
}
