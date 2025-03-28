import 'package:flutter/material.dart';
import 'package:flutter_mvvm/ui/todo_details/viewmodels/todo_details_viewmodel.dart';

class TodoDetailsScreen extends StatefulWidget {
  final TodoDetailsViewmodel viewmodel;
  final String id;

  const TodoDetailsScreen({
    super.key,
    required this.id,
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
        title: Text('Details of Todo ${widget.id}'),
      ),
    );
  }
}
