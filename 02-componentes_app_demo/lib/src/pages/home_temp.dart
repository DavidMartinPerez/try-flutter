import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar( title: Text('Home Component Temp') ),
        body: ListView(
          children: _crearItemsCorto(),
        ),
      ),
    );
  }

  // Creamos los items de dos formas

  /// Opcion larga de crear widget apartir de un List
  List<Widget> _crearItems() {

    // Transformamos la lista de string en una lista ed widget
    List<Widget> lista = new List<Widget>();

    for (var opcion in opciones) {
      final widget = ListTile(
        title: Text(opcion),
      );

      //Operador en cascada
      lista..add(widget)
           ..add( Divider() );
    }

    return lista;
  }

  /// Opcion corta de crear widget apartir de un List
  List<Widget> _crearItemsCorto() {
    return opciones.map( ( name ) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(name + '!'),
            subtitle: Text('Subtitulo'),
            leading: Icon( Icons.gesture ),
            trailing: Icon( Icons.arrow_forward_ios ),
            onTap: (){},
          ),
          Divider()
        ],
      );
    }).toList();
  }
}