import 'package:flutter/material.dart';
import 'package:flutter_mvvm/ui/todo/viewmodels/todo_viewmodel.dart';
import 'package:flutter_mvvm/ui/todo/widgets/add_todo_widget.dart';
import 'package:flutter_mvvm/ui/todo/widgets/todos_list.dart';

class TodoScreen extends StatelessWidget {
  final TodoViewmodel todoViewmodel;
  const TodoScreen({super.key, required this.todoViewmodel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Screen'),
      ),
      body: ListenableBuilder(
        listenable: todoViewmodel.load,
        builder: (context, child) {
          if (todoViewmodel.load.running) {
            return const Center(child: CircularProgressIndicator());
          }
          if (todoViewmodel.load.error) {
            return const Center(
                child: Text('An error has occurred getting todos'));
          }
          return child!;
        },
        child: ListenableBuilder(
          listenable: todoViewmodel,
          builder: (context, child) => TodosList(
            todos: todoViewmodel.todos,
            todoViewmodel: todoViewmodel,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddTodoWidget(todoViewmodel: todoViewmodel),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
