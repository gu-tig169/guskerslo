import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model.dart';

const API_KEY = '389aa3a8-af75-45c9-a163-5bd77dc3eee7';
const API_URL = 'https://todoapp-api-vldfm.ondigitalocean.app';

class API {
  static Future addTodo(Task task) async {
    var json = jsonEncode(Task.toJson(task));
    print(json);
    await http.post(
      '$API_URL/todos?key=$API_KEY',
      body: json,
      headers: {'Content-Type': 'application/json'},
    );
  }

  static Future updateTodos(Task task, String id) async {
    var json = jsonEncode(Task.toJson(task));
    print(json);
    await http.put('$API_URL/todos/$id?key=$API_KEY',
        body: json, headers: {'Content-Type': 'application/json'});
  }

  static Future deleteTask(String id) async {
    await http.delete('$API_URL/todos/$id?key=$API_KEY');
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
