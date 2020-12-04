import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:login_app/api%20_codes/apitasks.dart';
import 'package:login_app/colours.dart';
import 'package:login_app/models/task.dart';
import 'package:login_app/screens/addtask.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String token = '';
  bool isAsyncCall = true;
  List<Task> listTasks = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callApi();
    /* getTokenSharedPref().then((value) {
      setState(() {
        token = value;
        print(value);
      });
    });*/
  }

  void showSnackBar(BuildContext context, String text) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  callApi() {
    ApiTask.getAllTasks().then((value) {
      setState(() {
        listTasks = value;
        isAsyncCall = false;
      });
    });
  }

  TextDecoration getTextDecoration(bool value) {
    if (value) {
      return TextDecoration.lineThrough;
    } else {
      return TextDecoration.none;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('inchallah list'),
        backgroundColor: colorPrimary,
      ),
      body: Column(
        children: [
          Expanded(
              child: ModalProgressHUD(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) => Slidable(
                key: Key(listTasks[index].description),
                actionExtentRatio: 0.25,
                actionPane: SlidableDrawerActionPane(),
                secondaryActions: <Widget>[
                  IconSlideAction(
                    caption: 'Delete',
                    color: Colors.red,
                    icon: Icons.delete,
                    onTap: () {
                      setState(() {
                        isAsyncCall = true;
                      });
                      ApiTask.deleteTaskbyId(listTasks[index].id).then((value) {
                        setState(() {
                          listTasks.removeAt(index);
                          isAsyncCall = false;
                        });
                        showSnackBar(context, 'TASK DELETED');
                      });
                    },
                  )
                ],
                child: Card(
                  child: CheckboxListTile(
                    activeColor: colorPrimary,
                    title: Text(
                      listTasks[index].description,
                      style: TextStyle(
                          decoration:
                              getTextDecoration(listTasks[index].completed)),
                    ),
                    onChanged: (bool value) {
                      setState(() {
                        listTasks[index].completed = value;
                      });
                      print(listTasks[index].id);
                      var body = {
                        "completed": value,
                      };
                      ApiTask.updateTaskbyId(listTasks[index].id, body);
                    },
                    value: listTasks[index].completed,
                  ),
                ),
              ),
              itemCount: listTasks.length,
            ),
            inAsyncCall: isAsyncCall,
            opacity: 0.1,
            progressIndicator: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(colorPrimary),
            ),
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String added = await Navigator.push(
              context, MaterialPageRoute(builder: (_) => addtaskpage()));
          setState(() {
            isAsyncCall = true;
          });
          callApi();
        },
        backgroundColor: colorPrimary,
        child: Icon(
          Icons.playlist_add,
          color: Colors.white,
        ),
      ),
    );
  }
}
