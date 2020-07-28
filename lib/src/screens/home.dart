import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:audioplayers/audioplayers.dart';
import '../state_provider.dart';

class Home extends StatefulWidget {
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> cookieAnimation;
  AnimationController cookieController;
  AudioCache cache = new AudioCache();

  @override
  void initState() {
    super.initState();

    cookieController = AnimationController(
      duration: Duration(milliseconds: 60),
      vsync: this,
    );

    cookieAnimation = Tween(
      begin: 300.0,
      end: 280.0,
    ).animate(CurvedAnimation(
      parent: cookieController,
      curve: Curves.easeInOut,
    ));
  }

  Future<AudioPlayer> playLocalAsset() async {
    return await cache.play('pop.mp3');
  }

  onTap() {
    if (cookieController.status == AnimationStatus.dismissed) {
      cookieController.forward().then((val) => cookieController.reverse());
    }
    var provider = Provider.of<StateProvider>(context, listen: false);
    provider.manualClick();
    playLocalAsset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tap Screen'),
        actions: <Widget>[
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
      body: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Consumer<StateProvider>(
                  builder: (context, provider, child) => Text(
                    'Cookies: ${provider.cookieCount}',
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
                Consumer<StateProvider>(
                  builder: (context, provider, child) =>
                      Text('+ ${provider.autoClicksPerSec} cookies per second'),
                ),
                buildCookieAnimation(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCookieAnimation() {
    return AnimatedBuilder(
      animation: cookieAnimation,
      builder: (context, child) {
        return Container(
          child: child,
          width: cookieAnimation.value,
          height: cookieAnimation.value,
        );
      },
      child: Image(image: AssetImage('cookie.png')),
    );
  }
}
