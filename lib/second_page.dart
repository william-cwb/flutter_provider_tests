import 'package:flutter/material.dart';
import 'package:flutter_provider_tests/counter.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<Counter>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
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
            Text(
              'Counter 2',
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
            ),
            Text(
              counterProvider.counter2.toString(),
              style: TextStyle(
                color: Colors.red,
                fontSize: 35,
              ),
            ),
            Consumer<Counter>(
              builder: (BuildContext context, Counter value, Widget child) {
                return Column(
                  children: <Widget>[
                    Text(
                      'Counter 2 Consumer',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '${value.counter2}',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 35,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
