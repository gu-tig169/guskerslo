import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model.dart';

class ToDoList extends StatefulWidget {
  final List<Task> list;

  ToDoList({this.list});

  _ToDoListState createState() => _ToDoListState();  
}

class _ToDoListState extends State<ToDoList> {
     
    Widget build(BuildContext context) {
      return ListView.builder(
        itemBuilder: (context, index) => 
        _item(context, widget.list[index], index),
        itemCount: widget.list.length,
      );
    }
  
    Widget _item(context, Task item, index) {
      return ListTile(
          title: Text(item.text),
          leading: Checkbox(
            value: item.completed,
            onChanged: (bool done) {
              Provider.of<MyState>(context, listen: false).changeState(item);
            },        
          ),
          trailing: IconButton(
            onPressed: () {
              Provider.of<MyState>(context, listen: false).removeItem(index);
            },
            icon: Icon(Icons.cancel),
          )
      );
    }  
    }
