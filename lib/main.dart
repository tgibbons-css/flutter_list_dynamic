import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
    final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 5;
  List<String> myList = ["One", "Two", "Three", "Four"];
  int _selectedIndex = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
      int _len = myList.length;
      print("The size of list is $_len");
      myList.add(_counter.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: myList.length,
            //shrinkWrap: true,
            itemBuilder: (BuildContext context, int position) {
              return ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(Icons.airline_seat_recline_normal_rounded),
                      Text("Row :"+myList[position]),
                    ],
                  ),
                selected: position == _selectedIndex,
                onTap: () {
                  setState(() {
                    _selectedIndex = position;
                  });
                },
              );
            }
          ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
