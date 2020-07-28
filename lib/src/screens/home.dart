import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state_provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tap Screen'),
        actions: <Widget>[
          // action button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/store');
              },
            ),
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
                provider.manualClick();
              },
            ),
          ],
        ),
      ),
    );
  }
}
