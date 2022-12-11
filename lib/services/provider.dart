import 'dart:convert';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'model.dart';
import 'package:http/http.dart' as http;

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  Future<User> getUser() async {
    final response =
        await http.get(Uri.parse('https://random-data-api.com/api/v2/users'));
    return User.fromJson(jsonDecode(response.body));
  }
}
