import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state_provider.dart';

class Store extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Consumer<StateProvider>(
            builder: (context, provider, child) =>
                Text('Store (${provider.cookieCount} cookies)'),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: IconButton(
                icon: Icon(Icons.group_work),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
              ),
            ),
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'AutoClickers',
              ),
              Tab(
                text: 'Upgrades',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Column(
                children: [
                  buildAutoClickerInventory(),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        buildAutoClickerTile('Grandma', context),
                        Divider(),
                        buildAutoClickerTile('Farm', context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Text('This will be upgrades'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAutoClickerInventory() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: <Widget>[
          Text(
            'Owned AutoClickers:',
            style: TextStyle(fontSize: 30.0),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text('Grandmas:', textAlign: TextAlign.center),
                    Consumer<StateProvider>(
                      builder: (context, provider, child) =>
                          Text('${provider.clickersOwned["Grandma"] ?? 0}'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text('Farms:', textAlign: TextAlign.center),
                    Consumer<StateProvider>(
                      builder: (context, provider, child) =>
                          Text('${provider.clickersOwned["Farm"] ?? 0}'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Consumer<StateProvider>(
            builder: (context, provider, child) =>
                Text('+ ${provider.autoClicksPerSec} cookies per second'),
          ),
        ],
      ),
    );
  }

  Widget buildAutoClickerTile(String type, BuildContext context) {
    var provider = Provider.of<StateProvider>(context);

    return Ink(
      color: Colors.orange[100],
      child: ListTile(
        enabled:
            provider.cookieCount >= provider.availableAutoClickers[type].cost,
        title: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(type + ': '),
            Text('Cost: ' +
                provider.availableAutoClickers[type].cost.toString() +
                ' cookies'),
          ],
        ),
        onTap: () {
          print('auto clicker buy tile tapped with type: ' + type);
          provider.purchaseAutoClicker(type);
        },
      ),
    );
  }
}
