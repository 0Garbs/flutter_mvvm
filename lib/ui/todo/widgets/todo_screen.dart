import 'package:flutter/material.dart';
import 'package:flutter_mvvm/ui/todo/viewmodels/todo_viewmodel.dart';

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
            return child! ;
          },
          child: ListenableBuilder(
              listenable: todoViewmodel,
              builder: (context, child) {
                return ListView.builder(
                  itemCount: todoViewmodel.todos.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: Text('${todoViewmodel.todos[index].id}'),
                    title: Text(todoViewmodel.todos[index].name),
                  ),
                );
              }),
        ));
  }
}
