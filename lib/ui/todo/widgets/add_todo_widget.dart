import 'package:flutter/material.dart';
import 'package:flutter_mvvm/ui/todo/viewmodels/todo_viewmodel.dart';

class AddTodoWidget extends StatefulWidget {
  final TodoViewmodel todoViewmodel;
  const AddTodoWidget({super.key, required this.todoViewmodel});

  @override
  State<AddTodoWidget> createState() => _AddTodoWidgetState();
}

class _AddTodoWidgetState extends State<AddTodoWidget> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  final verticalGap = const SizedBox(height: 16.0);

  @override
  void initState() {
    widget.todoViewmodel.addTodo.addListener(_onResult);
    super.initState();
  }

  void _onResult() {
    if (widget.todoViewmodel.addTodo.running) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          content: IntrinsicHeight(
            child: Center(child: CircularProgressIndicator()),
          ),
        ),
      );
    } else {
      if (widget.todoViewmodel.addTodo.completed) {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Todo successfully created'),
            backgroundColor: Colors.green,
          ),
        );
      }
      if (widget.todoViewmodel.addTodo.error) {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
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
    _nameController.dispose();
    widget.todoViewmodel.addTodo.removeListener(_onResult);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: IntrinsicHeight(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Row(children: [Text('Add new Todo\'s:')]),
              verticalGap,
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              verticalGap,
              ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() == false) {
                      return;
                    }
                    widget.todoViewmodel.addTodo.execute(_nameController.text);
                  },
                  child: const Text('Send')),
            ],
          ),
        ),
      ),
    );
  }
}
