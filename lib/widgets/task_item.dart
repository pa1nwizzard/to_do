import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/providers/task_provider.dart';

class TaskItem extends StatelessWidget {
  final int index;
  const TaskItem({super.key, required this.index});
  

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TaskProvider>();
    final task = provider.tasks[index];
    return ListTile(
      leading: Checkbox(
        activeColor: Colors.greenAccent,
        checkColor: Colors.black,
        value: task.isDone,
        onChanged: (_) => provider.toggleTask(index)
      ),
      title: Text(
        task.title,
        style: TextStyle(
          color: Colors.white
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          provider.deleteTask(index);
        },
        icon: Icon(Icons.delete),
      ),
    );
  }
}