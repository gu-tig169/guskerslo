import 'dart:collection';
import 'package:flutter/material.dart';
import 'API.dart';

class Task {
  String text;
  bool completed;
  String id;

  Task({
    this.text,
    this.completed = false,
    this.id,
  });

  static Map<String, dynamic> toJson(Task task) {
    return {
      'text': task.text,
      'done': task.completed,
    };
  }

  static Task fromJson(Map<String, dynamic> json) {
    return Task(text: json['title'], completed: json['done'], id: json['id']);
  }

  void toggleCompleted() {
    if (completed == true) {
      completed = false;
    } else {
      completed = true;
    }
  }
}

class MyState extends ChangeNotifier {
  List<Task> _list = [];

  String _filterBy = "All";

  List<Task> get list => _list;

  String get filterBy => _filterBy;

  UnmodifiableListView<Task> get filteredTasks {
    if (_filterBy == 'All') return allTasks;
  }

  UnmodifiableListView<Task> get allTasks => UnmodifiableListView(_list);
  UnmodifiableListView<Task> get incompleteTasks =>
      UnmodifiableListView(_list.where((task) => !task.completed));
  UnmodifiableListView<Task> get completedTasks =>
      UnmodifiableListView(_list.where((task) => task.completed));

  Future getList() async {
    List<Task> list = await API.getTodos();
    _list = list;
    notifyListeners();
  }

  void addItem(Task task) async {
    await API.addTodo(task);
    getList();
    //_list.add(Task(text: text));
    //notifyListeners();
  }

  void removeItem(Task task) async {
    await API.deleteTask(task.id);
    await getList();
    //_list.removeAt(index);
    //notifyListeners();
  }

  void changeState(Task task) {
    final taskIndex = _list.indexOf(task);
    _list[taskIndex].toggleCompleted();
    notifyListeners();
  }

  void setFilterBy(String filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }
}
