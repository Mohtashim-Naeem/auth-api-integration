import 'dart:convert';
import 'package:auth_integration/utils/api_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SignUpController extends GetxController {
  bool isSignUp = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences?> _prefs = SharedPreferences.getInstance();

  Future<void> registerWithEmail() async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    try {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.registerEmail);
      Map body = {
        'name': nameController.text,
        'email': emailController.text,
        'password': passwordController.text,
      };
      http.Response response =
          await http.post(url, headers: headers, body: jsonEncode(body));
      print("I am reponse ${response.body}");
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        print(json);

        if (json['code'] == 0) {
          var token = json['data']['Token'];
          print('token');
          final SharedPreferences? prefs = await _prefs;
          await prefs?.setString('token', token);
          nameController.clear();
          emailController.clear();
          passwordController.clear();
          Get.snackbar('succses', 'Done');
        } else {
          throw jsonDecode(response.body)['message'] ?? 'Unknown Error Occured';
        }
      } else {
        throw jsonDecode(response.body)['message'] ?? 'Unknown Error Occured';
      }
    } catch (e) {
      print(e);
      Get.snackbar('Error', '$e');
    }
  }
}
