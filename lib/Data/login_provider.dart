import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginProvider extends ChangeNotifier {
  final client = http.Client();
  // DECLARE TEXT EDITING CONTROLLER
  final emailId = TextEditingController();
  final password = TextEditingController();
  final roleId = TextEditingController();

  Future loginApi() async {
    final response = await client.post(
        Uri.parse(
            "https://echo.atrehealthtech.com/api/phases-2/authentication/user-login"),
        body: <String, dynamic>{
          "user_email_id": emailId.text.trim(),
          "password": password.text.trim(),
          "role_id": int.parse(roleId.text)
        });
    final result = jsonDecode(response.body);
    print(result);
    return result;
  }
}
