import 'package:flutter/material.dart';

import 'package:componentes_app_demo/src/widget/avatar.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alerts'),
        actions: <Widget>[
          AvatarWidget()
        ],
      ),
      body: Center(
        child: RaisedButton(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text('Mostrar alerta'),
          color: Colors.blue[300],
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _showAlert(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.exit_to_app),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showAlert(context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),
            title: Text('Titulo alerta'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Contenido de la alerta'),
                FlutterLogo(
                  size: 100,
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () => Navigator.of(context).pop(),
                shape: StadiumBorder(),
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
                shape: StadiumBorder(),
              )
            ],
          );
        });
  }
}
