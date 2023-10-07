import 'package:flutter/material.dart';

// What we are doing here is called Prop Drilling. Sometimes, when data is
// available really high-up in the widget tree and we need to access that same
// particular data in a widget that is deep down in the widget tree hierarchy or
// vice-versa, we need to pass that data through all the parent widgets of that
// certain widget which requires the data, which is very wasteful and painful.
// It significantly increases the complexity of the code and highly affects the
// ability to debug.

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen(this.addTaskCallback, {super.key});
  final Function addTaskCallback;

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late String taskTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF757575),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: Text(
                  'Add Task',
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 40.0),
                child: TextField(
                  textAlign: TextAlign.center,
                  autofocus: true,
                  cursorHeight: 30.0,
                  cursorColor: Colors.lightBlueAccent,
                  onChanged: (value) {
                    setState(() {
                      taskTitle = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 40.0),
                child: TextButton(
                  onPressed: () {
                    widget.addTaskCallback(taskTitle);
                  },
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.lightBlueAccent),
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
