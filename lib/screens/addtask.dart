import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/api%20_codes/apitasks.dart';
import 'package:login_app/colours.dart';
import 'package:login_app/widgets.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class addtaskpage extends StatefulWidget {
  @override
  _addtaskpageState createState() => _addtaskpageState();
}

class _addtaskpageState extends State<addtaskpage> {
  var taskcontroller = TextEditingController();
  bool isInasyncall = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('inchallah list'),
        backgroundColor: colorPrimary,
      ),
      body: ModalProgressHUD(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              Text('inchallah i will :',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  )),
              SizedBox(height: 40),
              t3EditTextField('task', taskcontroller, isPassword: false),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: t3Appbutton(
                  textContent: 'add',
                  onPressed: () {
                    setState(() {
                      isInasyncall = true;
                    });
                    var body = {"description": taskcontroller.text.toString()};
                    ApiTask.addnewtask(body).then((statusCode) {
                      setState(() {
                        isInasyncall = false;
                      });
                      if (statusCode == 200) {
                        Navigator.pop(context, 'added');
                      } else {
                        showMyDialog(
                          context,
                          'ERROR',
                          'SORRY SOMETHING WENT WRONG !',
                          () {
                            Navigator.pop(context);
                          },
                        );
                      }
                    });
                  },
                ),
              )
            ],
          ),
        ),
        inAsyncCall: isInasyncall,
        opacity: 0.1,
        progressIndicator: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(colorPrimary),
        ),
      ),
    );
  }
}
