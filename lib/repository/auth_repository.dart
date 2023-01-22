import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/model/response_login.dart';

class AuthRepository {
  Future<ResponseLogin> loginAuth() async {
    var url =
        "http://dev.pitjarus.co/api/sariroti_md/index.php/login/loginTest";
    var res = await http.post(Uri.parse(url),
        body: {'username': 'pitjarus', 'password': 'admin'});
    var data = json.decode(res.body);
    if (data['status'] == 'success') {
      return ResponseLogin.fromJson(data);
    } else {
      throw Exception('failed to connect');
    }
  }
}
