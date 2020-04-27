import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final textStyle = new TextStyle( fontSize: 25 );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Título'),
        centerTitle: true,
        elevation: 1.5,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Números de clicks', style: textStyle ),
            Text('0',style: textStyle )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('click');
        },
        child: Icon( Icons.add ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

}