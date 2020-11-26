import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model.dart';

const API_KEY = '8d6e9b44-597a-4b1a-823d-6216ed33a497';
const API_URL = 'https://todoapp-api-vldfm.ondigitalocean.app/';

class API {
  static Future addTodo(Task task) async {
    print(task);
    Map<String, dynamic> json = Task.toJson(task);
    var bodyString = jsonEncode(json);
    print(json);
    await http.post(
      '$API_URL/todos?key=$API_KEY',
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );

    print('done');
  }

  static Future updateTodos(Task task) async {
    var json = jsonEncode(Task.toJson(task));
    await http.put('$API_URL/todos/$id?key=$API_KEY',
    body: json);
  }


  static Future deleteTask(String taskId) async {
    await http.delete('$API_URL/todos/$taskId?key=$API_KEY');
  }

  static Future<List<Task>> getTodos() async {
    var response = await http.get('$API_URL/todos?key=$API_KEY');
    print(response.body);
    var json = jsonDecode(response.body);
    print(json);

    return json.map<Task>((data) {
      return Task.fromJson(data);
    }).toList();
  }
}
