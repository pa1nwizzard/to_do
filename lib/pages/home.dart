import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/providers/task_provider.dart';
import 'package:to_do/widgets/task_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            'what do you need to remember?',
            style: TextStyle(
              color: Colors.white
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 200,
                child: TextField(
                  decoration: InputDecoration(),
                  style: TextStyle(
                    color: Colors.black
                  ),
                  controller: _controller,
                  
                ),
              ),
              IconButton(
                onPressed: () {
                  if (_controller.text.isEmpty) {
                    return;
                  }
                  else {
                    Provider.of<TaskProvider>(context, listen: false).addTask(_controller.text);
                  }
                  _controller.clear();
                },
                icon: const Icon(Icons.check))
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: context.watch<TaskProvider>().tasks.length,
              itemBuilder: (context, index) {                
                return TaskItem(index: index);
              }
            ),
          )
        ],
      ),
    );
  }
}