import 'dart:convert';
import 'package:http/http.dart';

class NetworkService {
  final baseUrl = 'http://localhost:3000';

  Future<List<dynamic>?> fetchTodos() async {
    try {
      final response = await get(Uri.parse(baseUrl + '/todos'));
      return jsonDecode(response.body) as List;
    } catch (e) {
      return [];
    }
  }

  Future<bool> patchTodo(Map<String, String> patchObj, int id) async {
    try {
      await patch(Uri.parse(baseUrl + '/todo/$id'), body: patchObj);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Map?> addTodo(Map<String, String> todoObj) async {
    try {
      final response = await post(Uri.parse(baseUrl + '/todos'), body: todoObj);
      return jsonDecode(response.body);
    } catch (e) {
      return null;
    }
  }

  Future<bool> deleteTodo(int id) async {
    try {
      await delete(Uri.parse(baseUrl + "/todos/$id"));
      return true;
    } catch (er) {
      return false;
    }
  }
}
