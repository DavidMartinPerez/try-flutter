import 'package:flutter/material.dart';

import 'package:componentes_app_demo/src/providers/menu.dart';
import 'package:componentes_app_demo/src/utils/icon_string.dart';
import 'package:componentes_app_demo/src/widget/avatar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Componentes'),
          actions: <Widget>[
            AvatarWidget()
          ],
        ),
        body: _list());
  }

  Widget _list() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _createListItems(context: context, data: snapshot.data),
        );
      },
    );
  }

  List<Widget> _createListItems({List<dynamic> data, context}) {
    final List<Widget> opciones = [];

    //Comprobamos si viene nulo
    if( data == null ) {
      return [];
    }

    data.forEach((opt) {
      final widget = ListTile(
        title: Text(opt['texto']),
        leading: getIconByString(opt['icon']),
        trailing: Icon(Icons.arrow_forward, color: Colors.blue[200]),
        onTap: () => Navigator.pushNamed(context, opt['ruta'])
      );

      opciones..add(widget)..add(Divider());
    });

    return opciones;
  }
}
