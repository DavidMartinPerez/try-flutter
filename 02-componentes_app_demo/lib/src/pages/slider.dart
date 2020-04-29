import 'package:flutter/material.dart';

import 'package:componentes_app_demo/src/widget/avatar.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 400;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Slider'),
          actions: <Widget>[AvatarWidget()],
        ),
        body: Container(
            padding: EdgeInsets.only(top: 50),
            child: Column(
              children: <Widget>[
                _crearSlider(),
                Text('Tamaño: ${_valorSlider.round()}'),
                Expanded(child: _crearImagen()),
              ],
            )));
  }

  _crearSlider() {
    return Slider(
      activeColor: Colors.red[300],
      label: 'Tamaño de la imagen',
      value: _valorSlider,
      min: 100,
      max: 400,
      onChanged: (valor) {
        setState(() {
          _valorSlider = valor;
        });
      },
    );
  }

  Widget _crearImagen() {
    return FadeInImage(
      width: _valorSlider,
      fit: BoxFit.contain,
      image: NetworkImage('https://hardwaresfera.com/wp-content/uploads/2020/04/Narciso-Animal-Crossing-New-Horizons-Nintendo-Switch.png' ),
      placeholder: AssetImage( 'assets/img/jar-loading.gif' ),
    );
  }
}
