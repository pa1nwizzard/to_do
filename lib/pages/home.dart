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
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 36, 36, 36),
        surfaceTintColor: Color.fromARGB(255, 36, 36, 36),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 280,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Align(
                  alignment: AlignmentGeometry.bottomCenter,
                  child: Text(
                    'what do you\nneed to\nremember?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      height: 1.2
                    ),
                  ),
                ),
              ),
            ),
            Row(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  height: 40,
                  child: Theme(
                    data: ThemeData(
                      textSelectionTheme: const TextSelectionThemeData(
                      cursorColor: Colors.greenAccent,
                      selectionColor: Colors.greenAccent,
                      selectionHandleColor: Colors.greenAccent,
                    ),
                    ),
                    child: TextField(
                      cursorColor: Colors.greenAccent,
                      
                      maxLines: 1,
                      maxLength: 40,
                      decoration: InputDecoration(
                        filled: true,
                        counterText: "",
                        fillColor: Color.fromARGB(255, 75, 75, 75),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 9, horizontal: 16),
                        
                        
                      ),
                      style: TextStyle(
                        
                        color: Colors.white,
                      ),
                      controller: _controller,
                      
                    ),
                  ),
                ),
                IconButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    iconColor: Colors.black,
                    padding: EdgeInsets.zero,
                    iconSize: 30
                  ),
                  onPressed: () {
                    if (_controller.text.isEmpty) {
                      return;
                    }
                    else {
                      Provider.of<TaskProvider>(context, listen: false).addTask(_controller.text);
                    }
                    _controller.clear();
                  },
                  icon: const Icon(Icons.add)),
                  
              ],
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(top: 16, bottom: 16),
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
      ),
    );
  }
}