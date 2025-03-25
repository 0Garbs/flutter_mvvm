import 'package:flutter/material.dart';
import 'package:flutter_mvvm/domain/models/todo.dart';
import 'package:flutter_mvvm/ui/todo/viewmodels/todo_viewmodel.dart';

class TodoTile extends StatefulWidget {
  final Todo todo;
  final TodoViewmodel todoViewmodel;
  const TodoTile({super.key, required this.todo, required this.todoViewmodel});

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  void initState() {
    widget.todoViewmodel.removeTodo.addListener(_onResult);
    super.initState();
  }

  void _onResult() {
    if (widget.todoViewmodel.removeTodo.running) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          content: IntrinsicHeight(
            child: Center(child: CircularProgressIndicator()),
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      Navigator.of(context).pop();

      if (widget.todoViewmodel.removeTodo.completed) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Todo successfully created'),
            backgroundColor: Colors.green,
          ),
        );
      }
      if (widget.todoViewmodel.removeTodo.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error creating Todo'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    widget.todoViewmodel.removeTodo.removeListener(_onResult);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text('${widget.todo.id}'),
      title: Text(widget.todo.name),
      trailing: IconButton(
        onPressed: () {
          widget.todoViewmodel.removeTodo.execute(widget.todo);
        },
        icon: const Icon(Icons.delete, color: Colors.red),
      ),
    );
  }
}
