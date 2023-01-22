import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/front/store/store_list_page.dart';
import 'package:store_app/front/widget/login_button_widget.dart';
import 'package:store_app/model/response_login.dart';
import 'package:store_app/repository/auth_repository.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void login(String username, String password) async {
    var url =
        "http://dev.pitjarus.co/api/sariroti_md/index.php/login/loginTest";
    var res = await http.post(Uri.parse(url),
        body: {'username': username, 'password': password});
    var data = json.decode(res.body);
    if (data['status'] == 'success') {
      ResponseLogin.fromJson(data);
      Navigator.of(context).pushNamed('store');
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
        title: 'Authentication Failed',
        desc: 'Username or Password is not match',
        btnOkOnPress: () {},
        btnOkColor: Colors.green,
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerUsername = TextEditingController();
    TextEditingController controllerPassword = TextEditingController();
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Image.asset(
              'assets/detail.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              scale: 0.4,
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: TextField(
                    controller: controllerUsername,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color(0xffBAC5FE),
                        ),
                        border: OutlineInputBorder(),
                        hintText: 'Username'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                  child: TextField(
                    obscureText: true,
                    controller: controllerPassword,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Color(0xffBAC5FE),
                        ),
                        border: OutlineInputBorder(),
                        hintText: 'Password'),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                    onTap: () {
                      login(controllerUsername.text, controllerPassword.text);
                    },
                    child: LoginButtonWidget())
              ],
            ),
          ),
        ],
      ),
    );
  }
}
