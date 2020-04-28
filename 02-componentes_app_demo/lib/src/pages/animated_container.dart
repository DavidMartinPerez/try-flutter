import 'dart:math';

import 'package:flutter/material.dart';

import 'package:componentes_app_demo/src/widget/avatar.dart';

class AnimatedContainerPage extends StatefulWidget {
  AnimatedContainerPage({Key key}) : super(key: key);

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {

  double _width  = 50;
  double _height = 50;
  Color _color   = Colors.pink[300];

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
        actions: <Widget>[
          AvatarWidget()
        ],
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration( seconds: 1 ),
          curve: Curves.fastOutSlowIn,
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.play_arrow ),
        onPressed: () => _animated(),
      ),
    );
  }

  _animated() {

    final random = Random();

    setState(() {
      _width  = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _color  = Color.fromRGBO(
        random.nextInt(254),
        random.nextInt(254),
        random.nextInt(254),
        1
      );

      _borderRadius = BorderRadius.circular( random.nextInt(100).toDouble() );
    });
  }
}