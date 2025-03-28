import 'package:flutter/material.dart';
import 'package:flutter_mvvm/ui/todo_details/viewmodels/todo_details_viewmodel.dart';
import 'package:flutter_mvvm/ui/todo_details/widgets/todo_title.dart';

class TodoDetailsScreen extends StatefulWidget {
  final TodoDetailsViewmodel viewmodel;

  const TodoDetailsScreen({
    super.key,
    required this.viewmodel,
  });

  @override
  State<TodoDetailsScreen> createState() => _TodoDetailsScreenState();
}

class _TodoDetailsScreenState extends State<TodoDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details of Todo'),
      ),
      body: ListenableBuilder(
        listenable: widget.viewmodel.load,
        builder: (context, child) {
          if (widget.viewmodel.load.running) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (widget.viewmodel.load.error) {
            return const Center(
              child: Text('An error has occurred getting todo'),
            );
          }

          return child!;
        },
        child: ListenableBuilder(
            listenable: widget.viewmodel,
            builder: (context, child) {
              return TodoTitle(todo: widget.viewmodel.todo);
            }),
      ),
    );
  }
}
