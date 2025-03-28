import 'package:flutter/material.dart';
import 'package:flutter_mvvm/ui/todo/viewmodels/todo_viewmodel.dart';
import 'package:flutter_mvvm/ui/todo/widgets/add_todo_widget.dart';
import 'package:flutter_mvvm/ui/todo/widgets/todos_list.dart';

class TodoScreen extends StatefulWidget {
  final TodoViewmodel todoViewmodel;
  const TodoScreen({super.key, required this.todoViewmodel});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
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
            content: Text('Todo successfully deleted'),
            backgroundColor: Colors.green,
          ),
        );
      }
      if (widget.todoViewmodel.removeTodo.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error deleting Todo'),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Screen'),
      ),
      body: ListenableBuilder(
        listenable: widget.todoViewmodel.load,
        builder: (context, child) {
          if (widget.todoViewmodel.load.running) {
            return const Center(child: CircularProgressIndicator());
          }
          if (widget.todoViewmodel.load.error) {
            return const Center(
                child: Text('An error has occurred getting todos'));
          }
          return child!;
        },
        child: ListenableBuilder(
          listenable: widget.todoViewmodel,
          builder: (context, child) => TodosList(
            todos: widget.todoViewmodel.todos,
            onUpdateTodo: (todo) {
              widget.todoViewmodel.updateTodo.execute(todo);
            },
            onDeleteTodo: (todo) {
              widget.todoViewmodel.removeTodo.execute(todo);
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) =>
                AddTodoWidget(todoViewmodel: widget.todoViewmodel),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
