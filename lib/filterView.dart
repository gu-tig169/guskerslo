import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_app/ToDoList.dart';
import 'package:my_app/model.dart';

import 'ToDoList.dart';
import 'model.dart';

class AllTasksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Consumer<MyState>(
            builder: (context, task, child) => ToDoList(list: task.allTasks)
      )
   );
  }
}

class CompletedTasksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<MyState>(
        builder: (context, task, child) => ToDoList(
          list: task.completedTasks,
        ),
      ),
    );
  }
}

class IncompleteTasksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<MyState>(
        builder: (context, task, child) => ToDoList(
          list: task.incompleteTasks,
        ),
      ),
    );
  }
}