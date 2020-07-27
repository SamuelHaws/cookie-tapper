import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state_provider.dart';

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
            Consumer<StateProvider>(
              builder: (context, provider, child) =>
                  Text('${provider.cookieCount}'),
            ),
            RaisedButton(
              child: Text('Push me!'),
              onPressed: () {
                var provider =
                    Provider.of<StateProvider>(context, listen: false);
                provider.increment();
              },
            ),
          ],
        ),
      ),
    );
  }
}
