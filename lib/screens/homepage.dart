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
  }

  void showSnackBar(BuildContext context, String text) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  callApi() async {
    var value = await ApiTask.getAllTasks();

    setState(() {
      listTasks = value;
      isAsyncCall = false;
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
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 80.0,
              child: DrawerHeader(
                child: Container(
                  margin: EdgeInsets.fromLTRB(100, 00, 10, 00),
                  padding: EdgeInsets.all(00.0),
                  child: Text('Menu',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                ),
                decoration: BoxDecoration(
                  color: colorPrimary,
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Mes parcelles',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Mes sinistres',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Déclarer un sinistre',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Mon compte',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Nous contacter',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
        /*child: Row(
        children: [
          Column(children: [SizedBox(height: 500000)]),
          Column(children: [
            Card(
                child: Text(
              'Notifications',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            )),
          ])
        ],
      )*/
      ),
      appBar: AppBar(
        title: Text('CTAMAPP'),
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
