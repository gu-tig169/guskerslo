import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model.dart';

class SecondView extends StatelessWidget {
  Widget build(context) {
    var controller = TextEditingController(text:'');

    return StatefulBuilder(
        builder: (context, setState) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.grey,
              title: Text(
                'TIG169 TODO',
                style: TextStyle(color: Colors.black, fontSize: 26),
              ),
            ),
            body: Column(
              children: [
                Container(height: 30,
                ),
                Container(
                  width: 330.0,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'What are you going to do?',
                      contentPadding: const EdgeInsets.only(left: 20.0)),
                      controller: controller
                      ),
                      ),   
                Container (height: 30,),
                RaisedButton(
                    child: Text('+ADD'),
                    onPressed: () {
                      Provider.of<MyState>(context, listen: false)
                          .addItem(controller.text);
                      Navigator.pop(context,
                        );
                    }),
              ],
            )));
  }
}
