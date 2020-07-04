import 'package:flutter/material.dart';
import 'package:flutter_provider_tests/counter.dart';
import 'package:flutter_provider_tests/second_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Provider Tests'),
      ),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<Counter>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Counter 1',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                ),
              ),
              Text(
                counterProvider.counter1.toString(),
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 35,
                ),
              ),
              Provider<Counter>(
                create: (_) => Counter(),
                child: Text(
                  'Counter 2',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                  ),
                ),
              ),
              Text(
                counterProvider.counter2.toString(),
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 35,
                ),
              ),
              OutlineButton(
                child: Text('Second Screen'),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => SecondPage()));
                },
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              heroTag: "btn1",
              backgroundColor: Colors.red,
              onPressed: () {
                counterProvider.setCounter2();
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
            FloatingActionButton(
              heroTag: "btn2",
              onPressed: () {
                counterProvider.setCounter1();
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          ],
        ));
  }
}
