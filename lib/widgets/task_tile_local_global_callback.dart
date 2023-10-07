// This file is just for my understanding of Local State, Global State, and callback.

import 'package:flutter/material.dart';

// Local State is information that is something useful to a particular page
// and might not be useful elsewhere. Local state appears way down in the
// widget tree and is cost efficient when needs modification.

// Global State is information that is accessible or can be accessed across the
// application. Usually appear in the middle or beginning of the widget tree
// and is mostly costly, since any modification to it would cause the entire
// application to be rebuilt from the point changes are going to be reflected.
// Global state should be used sparingly, as it can make your application more
// difficult to maintain and debug.

// Callbacks are just like Future operations where in Future operations we use
// async/await to deal with ongoing processes and then proceed further,
// in callbacks, we wait for the user input operations.

class TaskTile extends StatefulWidget {
  const TaskTile({
    super.key,
  });

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  // State lifted up
  bool isChecked = false;

  void checkBoxCallback(bool? checkBoxState) {
    setState(() {
      // ?? checks If something is null. If it's not null it returns its own
      // value but if it's null it returns the value after ??
      isChecked = checkBoxState ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Buy Milk',
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: TaskCheckbox(
        checkBoxState: isChecked,
        toggleCheckboxState: checkBoxCallback,
      ),
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  const TaskCheckbox({
    super.key,
    required this.checkBoxState,
    required this.toggleCheckboxState,
  });

  final bool checkBoxState;
  final void Function(bool?)? toggleCheckboxState;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checkBoxState,
      onChanged: toggleCheckboxState,
    );
  }
}
