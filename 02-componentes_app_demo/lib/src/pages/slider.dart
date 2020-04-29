import 'package:flutter/material.dart';

import 'package:componentes_app_demo/src/widget/avatar.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 400;
  bool _bloquearCheck = false;

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
              _crearCheckbox(),
              _crearSwitch(),
              Divider(),
              Text('Tamaño: ${_valorSlider.round()}'),
              Expanded(child: _crearImagen()),
            ],
          )
        )
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.red[300],
      label: 'Tamaño de la imagen',
      value: _valorSlider,
      min: 100,
      max: 400,
      onChanged: _bloquearCheck ? null : (valor) {
        setState(() {
          _valorSlider = valor;
        });
      },
    );
  }

  Widget _crearCheckbox() {
    // return Checkbox(
    //   activeColor: Colors.red[300],
    //   value: _bloquearCheck,
    //   onChanged: ( check ) {
    //     setState(() {
    //       _bloquearCheck = check;
    //     });
    //   },
    // );
    return CheckboxListTile(
      title: Text('Bloquear slider'),
      activeColor: Colors.red[300],
      value: _bloquearCheck,
      onChanged: ( check ) {
        setState(() {
          _bloquearCheck = check;
        });
      },
    );
  }

  Widget _crearSwitch() {
    // return Switch(
    //   activeColor: Colors.red[300],
    //   value: _bloquearCheck,
    //   onChanged: ( check ) {
    //     setState(() {
    //       _bloquearCheck = check;
    //     });
    //   },
    // );
    return SwitchListTile(
      title: Text('Bloquear slider'),
      activeColor: Colors.red[300],
      value: _bloquearCheck,
      onChanged: ( check ) {
        setState(() {
          _bloquearCheck = check;
        });
      },
    );
  }

  Widget _crearImagen() {
    return FadeInImage(
      width: _valorSlider,
      fit: BoxFit.contain,
      image: NetworkImage(
          'https://hardwaresfera.com/wp-content/uploads/2020/04/Narciso-Animal-Crossing-New-Horizons-Nintendo-Switch.png'),
      placeholder: AssetImage('assets/img/jar-loading.gif'),
    );
  }
}
