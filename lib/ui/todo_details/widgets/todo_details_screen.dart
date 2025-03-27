import 'package:flutter/material.dart';

class TodoDetailsScreen extends StatefulWidget {
  final String id;
  const TodoDetailsScreen({super.key, required this.id});

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
