import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Todo(),
    );
  }
}

class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  // ignore: prefer_typing_uninitialized_variables
  var output;
  List<dynamic> lst = [1, 2, 3];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        backgroundColor: Color(0xfffacc4d),
        // ignore: prefer_const_constructors
        title: Text('Todo App'),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              // ignore: prefer_const_constructors
              PopupMenuItem(
                value: 0,
                // ignore: prefer_const_constructors
                child: Text('Settings'),
              ),
              // ignore: prefer_const_constructors
              PopupMenuItem(
                value: 0,
                // ignore: prefer_const_constructors
                child: Text('Manage Categories'),
              ),
            ],
          )
        ],
      ),
      body: ListView.builder(
        itemCount: lst.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 60,
            // ignore: prefer_const_constructors
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              // ignore: prefer_const_constructors
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(6),
            ),
            child: ListTile(
              title: Text('${lst[index]}'),
              // ignore: avoid_unnecessary_containers, sized_box_for_whitespace
              trailing: Container(
                width: 50,
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    // ignore: prefer_const_constructors
                    GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  // ignore: prefer_const_constructors
                                  title: Text('Edit Item'),
                                  content: TextField(
                                    onChanged: (value) {
                                      output = value;
                                    },
                                  ),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          setState(() {
                                            lst.replaceRange(
                                                index, index + 1, {output});
                                          });
                                        },
                                        // ignore: prefer_const_constructors
                                        child: Text('Edit')),
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        // ignore: prefer_const_constructors
                                        child: Text('Cancel'))
                                  ],
                                );
                              });
                        },
                        // ignore: prefer_const_constructors
                        child: Icon(Icons.edit)),
                    // ignore: prefer_const_constructors
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            lst.removeAt(index);
                          });
                        },
                        // ignore: prefer_const_constructors
                        child: Icon(Icons.delete)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        // ignore: prefer_const_constructors
        backgroundColor: Color(0xfffacc4d),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  // ignore: prefer_const_constructors
                  title: Text('Add Item'),
                  content: TextField(
                    onChanged: (value) {
                      output = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          setState(() {
                            lst.add(output);
                          });
                        },
                        // ignore: prefer_const_constructors
                        child: Text('Add')),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        // ignore: prefer_const_constructors
                        child: Text('Cancel'))
                  ],
                );
              });
        },
        // ignore: prefer_const_constructors
        child: Icon(Icons.add),
      ),
    );
  }
}
