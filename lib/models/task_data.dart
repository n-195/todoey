import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(taskTitle: 'Buy Milk'),
    Task(taskTitle: 'Buy Car'),
    Task(taskTitle: 'Buy Food'),
  ];

  // If we simply return the list here through a getter, then it defeats the
  // purpose of making the list private/unmodifiable to the outside.
  // That is why, Unmodifiable ListView is used here as it provides an unmodifiable
  // view of a list as a list.
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String taskTitle) {
    final task = Task(taskTitle: taskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void toggleTaskDone(int index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
