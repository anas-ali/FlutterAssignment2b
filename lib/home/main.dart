import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/home/todo_item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

final List<ToDoItem> todos = new List();
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Todo List Application'),
        ),
        body:  ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: Colors.black,
            ),
            itemCount: todos.length,
            itemBuilder: (context, i) {
              return ListTile(
                title: Text(
                  todos.elementAt(i).message,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ), trailing: Text(
              todos.elementAt(i).time,
              style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal),
              ));
            }
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: addToDo,
          child: Icon(Icons.add),
        )
    );
  }

  String getTodoTime() {
    var now = new DateTime.now();
    var formatter = new DateFormat('hh:mm a');
    return formatter.format(now);
  }

  void addToDo() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Scaffold(
              appBar: AppBar(
                title: Text('Add Your ToDo Item'),
              ),
              body: TextField(
                onSubmitted: (String value) async {
                  todos.add(ToDoItem(time: getTodoTime(), message: value));
                  Navigator.pop(context);
                },
              )
          );
        },
      ),
    );
  }
}