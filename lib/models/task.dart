class Task {
  late final String taskTitle;
  late bool isDone;

  Task({required this.taskTitle, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
