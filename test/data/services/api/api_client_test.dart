import 'package:flutter_mvvm/data/services/api/api_client.dart';
import 'package:flutter_mvvm/data/services/api/models/todo/todo_api_model.dart';
import 'package:flutter_mvvm/domain/models/todo.dart';
import 'package:flutter_mvvm/utils/result/result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ApiClient client;

  setUp(() {
    client = ApiClient();
  });

  group('Should teste [ApiClient]', () {
    test('Should return Result Ok when getTodos()', () async {
      //? Arrange
      //! Act
      final result = await client.getTodos();

      //* Assert
      expect(result.asOk.value, isA<List<Todo>>());
    });

    test('Should create a Todo calling postTodo', () async {
      //? Arrange
      //! Act
      final result =
          await client.postTodo(const TodoApiModel.create(name: 'Todo 1'));

      expect((result as Ok).value, isA<void>());
    });

    test('Should delete a Todo calling deleteTodo', () async {
      //? Arrange
      //! Act
      final createdTodo =
          await client.postTodo(const TodoApiModel.create(name: 'Todo 1'));
      final result = await client.deleteTodo((createdTodo as Ok<Todo>).value);

      //* Assert
      expect((result as Ok).value, isA<void>());
    });
  });
}
