import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/counter.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
        actions: <Widget>[
          // action button
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/store');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Consumer<Counter>(
              builder: (context, counter, child) => Text('${counter.value}'),
            ),
            RaisedButton(
              child: Text('Push me!'),
              onPressed: () {
                // Navigate to the second screen when tapped.
                var count = Provider.of<Counter>(context, listen: false);

                count.increment();
              },
            ),
          ],
        ),
      ),
    );
  }
}
