import 'package:flutter/material.dart';

class Store extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Store'),
        actions: <Widget>[
          // action button
          IconButton(
            icon: Icon(Icons.group_work),
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
        ],
      ),
      body: Center(child: Text('Welcome to the Store!')),
    );
  }
}
