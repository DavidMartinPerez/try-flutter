import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  @override
  createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  final _textStyle = new TextStyle(fontSize: 25);

  int _contador = 0;

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
            Text('Contador:', style: _textStyle),
            Text('$_contador', style: _textStyle)
          ],
        ),
      ),
      floatingActionButton: _crearBotones(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _crearBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FloatingActionButton(
          onPressed: _resetContador,
          child: Icon(Icons.refresh),
        ),
        FloatingActionButton(
          onPressed: _restar,
          child: Icon(Icons.remove),
        ),
        FloatingActionButton(
          onPressed: _sumar,
          child: Icon(Icons.add),
        ),
      ],
    );
  }


  _sumar() => setState(() => _contador++ );
  _restar() => setState(() => _contador-- );
  _resetContador() => setState(() => _contador = 0 );
}
