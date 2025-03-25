import 'package:flutter_mvvm/ui/todo/viewmodels/todo_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Should teste Todo ViewModel', () {
    test('Verifying initial ViewModel state', () async {
      //? Arrange
      final todoViewModel = TodoViewmodel();

      //* Assert
      expect(todoViewModel.todos, isEmpty);
    });

    test('Should add a Todo', () async {
      //? Arrange
      final todoViewModel = TodoViewmodel();

      expect(todoViewModel.todos, isEmpty);

      //! Act
      await todoViewModel.addTodo.execute('Todo 1');

      //* Assert
      expect(todoViewModel.todos, isNotEmpty);
      expect(todoViewModel.todos.first.name, 'Todo 1');
      expect(todoViewModel.todos.first.id, isNotNull);
    });

    test('Shoul remove a Todo', () async {
      //? Arrange
      final todoViewModel = TodoViewmodel();

      expect(todoViewModel.todos, isEmpty);

      await todoViewModel.addTodo.execute('Todo 1');

      expect(todoViewModel.todos, isNotEmpty);

      //! Act
      await todoViewModel.removeTodo.execute(todoViewModel.todos.first);

      //* Assert
      expect(todoViewModel.todos, isEmpty);
    });
  });
}
