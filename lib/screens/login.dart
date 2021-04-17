import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/api%20_codes/api_auth.dart';
import 'package:login_app/colours.dart';
import 'package:login_app/utils.dart';
import 'package:login_app/widgets.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  bool isRemember = false;
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  bool _isInAsyncCall = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: ModalProgressHUD(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: (MediaQuery.of(context).size.height) / 3.5,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/t3_ic_background.png',
                        fit: BoxFit.fill,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("CtamApp",
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 4),
                            /*Text("List",
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),*/
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(right: 45),
                  transform: Matrix4.translationValues(25, -45, 0),
                  child: Image.asset(
                    'assets/ctama.png',
                    height: 100,
                    width: 100,
                  ),
                ),
                t3EditTextField('Email', emailcontroller, isPassword: false),
                SizedBox(height: 16),
                t3EditTextField('password', passwordcontroller,
                    isPassword: true),
                SizedBox(height: 16),
                /***********************************************************************************/
                SizedBox(height: 16),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      Checkbox(
                        activeColor: colorPrimary,
                        focusColor: colorPrimary,
                        value: isRemember,
                        onChanged: (bool value) {
                          setState(() {
                            isRemember = value;
                          });
                        },
                      ),
                      Text(
                        'Remember',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 14),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: t3Appbutton(
                    textContent: 'Sign In',
                    onPressed: () {
                      setState(() {
                        _isInAsyncCall = true;
                      });
                      var body = {
                        "email": emailcontroller.text.toString(),
                        "password": passwordcontroller.text.toString(),
                      };
                      ApiAuth.login(body).then((response) {
                        setState(() {
                          _isInAsyncCall = false;
                        });
                        if (response.statusCode == 200) {
                          var body = jsonDecode(response.body);
                          String mytoken = body['token'];
                          saveTokenSharedPref(mytoken);
                          Navigator.pushNamed(context, '/home');
                        } else {
                          showMyDialog(
                              context, 'error', response.body.toString(), () {
                            Navigator.pop(context);
                          });
                          print(response.body);
                        }
                      });
                    },
                  ),
                ),
                SizedBox(height: 20),
                Text('Forgot password'),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account ?'),
                    Container(
                      margin: EdgeInsets.only(left: 4),
                      child: GestureDetector(
                        child: Text('Sign Up',
                            style: TextStyle(
                                fontSize: 18,
                                decoration: TextDecoration.underline,
                                color: colorPrimary)),
                        onTap: () {
                          Navigator.pushNamed(context, '/register');
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          inAsyncCall: _isInAsyncCall,
          // demo of some additional parameters
          opacity: 0.5,
          progressIndicator: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
