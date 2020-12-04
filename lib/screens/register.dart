import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/api _codes/api_auth.dart';
import 'package:login_app/colours.dart';
import 'package:login_app/widgets.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class registerpage extends StatefulWidget {
  @override
  _registerpageState createState() => _registerpageState();
}

class _registerpageState extends State<registerpage> {
  var passwordcontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var namecontroller = TextEditingController();
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
                            Text("Inchalah",
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 4),
                            Text("List",
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      transform: Matrix4.translationValues(0, 20, 0),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(right: 45),
                      transform: Matrix4.translationValues(25, -45, 0),
                      child: Image.asset(
                        'assets/todo.png',
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ],
                ),
                t3EditTextField('Email', emailcontroller, isPassword: false),
                SizedBox(height: 16),
                t3EditTextField('password', passwordcontroller,
                    isPassword: true),
                SizedBox(height: 16),
                t3EditTextField('name', namecontroller, isPassword: false),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: t3Appbutton(
                    textContent: 'Sign Up',
                    onPressed: () {
                      setState(() {
                        _isInAsyncCall = true;
                      });
                      var body = {
                        "name": namecontroller.text.toString(),
                        "email": emailcontroller.text.toString(),
                        "password": passwordcontroller.text.toString(),
                        "age": 20
                      };
                      ApiAuth.register(body).then((response) {
                        setState(() {
                          _isInAsyncCall = false;
                        });
                        if (response.statusCode == 201) {
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
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have account '),
                    Container(
                      margin: EdgeInsets.only(left: 4),
                      child: GestureDetector(
                        child: Text('Sign In',
                            style: TextStyle(
                                fontSize: 18,
                                decoration: TextDecoration.underline,
                                color: colorPrimary)),
                        onTap: () {
                          Navigator.pop(
                            context,
                          );
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
