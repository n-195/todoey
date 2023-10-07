import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/widgets/task_tile.dart';
import '../models/task_data.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
        builder: (BuildContext context, TaskData taskData, Widget? child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return TaskTile(
            // isChecked: Provider.of<TaskData>(context).tasks[index].isDone,
            // Rather than using Provider.of multiple times and making the code
            // more wordy, we can wrap it up inside a Consumer Widget, which listens
            // on the behalf of all the child properties in the need of that data.

            isChecked: taskData.tasks[index].isDone,
            taskTitle: taskData.tasks[index].taskTitle,
            checkBoxCallback: (bool? checkBoxState) {
              // setState(() {
              taskData.toggleTaskDone(index);
              // });
            },
            longPressCallback: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Delete Item'),
                    content: const Text(
                        'Are you sure you want to delete this item?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          taskData.deleteTask(index);
                          Navigator.pop(context);
                        },
                        child: const Text('Delete'),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
        itemCount: taskData.taskCount,
      );
    });
  }
}
