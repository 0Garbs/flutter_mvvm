import 'package:flutter/material.dart';

class TodoDescription extends StatelessWidget {
  const TodoDescription({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Text(
          description,
          style: const TextStyle(color: Colors.white, fontSize: 16.0),
        ),
      ),
    );
  }
}
