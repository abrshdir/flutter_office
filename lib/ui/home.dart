import 'package:flutter/material.dart';

class HomeS extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<HomeS> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Image.asset('assets/me.png', fit: BoxFit.cover),
            new Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Text('New App'),
                elevation: 0.0,
                backgroundColor: Color(0xFF81D4FA).withOpacity(0.5),
              ),
            ),
          ],
        ),
      )
    );
  }

}
