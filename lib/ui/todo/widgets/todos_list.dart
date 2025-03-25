import 'package:flutter/material.dart';
import 'package:flutter_mvvm/domain/models/todo.dart';
import 'package:flutter_mvvm/ui/todo/viewmodels/todo_viewmodel.dart';
import 'package:flutter_mvvm/ui/todo/widgets/todo_tile.dart';

class TodosList extends StatelessWidget {
  final List<Todo> todos;
  final TodoViewmodel todoViewmodel;

  const TodosList({
    super.key,
    required this.todos,
    required this.todoViewmodel,
  });

  @override
  Widget build(BuildContext context) {
    if (todos.isEmpty) {
      return const Center(child: Text('No todos yet...'));
    }
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) => TodoTile(
        todo: todos[index],
        todoViewmodel: todoViewmodel,
      ),
    );
  }
}
