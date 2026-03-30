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
      subtitle: Text(task.title),
      title: ElevatedButton(
        onPressed: () {
          provider.deleteTask(index);
        },
        child: Text(''),
      ),
      trailing: Checkbox(
        value: task.isDone,
        onChanged: (_) => provider.toggleTask(index)
      ),
    );
  }
}