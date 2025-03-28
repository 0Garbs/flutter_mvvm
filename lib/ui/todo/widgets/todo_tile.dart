import 'package:flutter/material.dart';
import 'package:flutter_mvvm/routing/routes.dart';
import 'package:flutter_mvvm/utils/typedefs/todos.dart';
import 'package:flutter_mvvm/domain/models/todo.dart';
import 'package:go_router/go_router.dart';

class TodoTile extends StatelessWidget {
  final OnDeleteTodo onDeleteTodo;
  final OnUpdateTodo onUpdateTodo;
  final Todo todo;
  const TodoTile({
    super.key,
    required this.todo,
    required this.onDeleteTodo,
    required this.onUpdateTodo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(Routes.todoDetails(todo.id)),
      child: Card(
        child: ListTile(
          leading: Checkbox(
            value: todo.done,
            onChanged: (value) => onUpdateTodo(todo.copyWith(done: value)),
          ),
          title: Text(todo.name),
          trailing: IconButton(
            onPressed: () => onDeleteTodo(todo),
            // () {
            //   todoViewmodel.removeTodo.execute(todo);
            // },
            icon: const Icon(Icons.delete, color: Colors.red),
          ),
        ),
      ),
    );
  }
}
