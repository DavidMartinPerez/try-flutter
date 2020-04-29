import 'package:flutter/material.dart';

import 'package:componentes_app_demo/src/widget/avatar.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _contrasena = '';
  String _fecha = '';
  String _opcionSeleccionada = 'Volar';

  List _poderes = ['Volar', 'Super Fuerza', 'Trepar', 'Regeneracion'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
        actions: <Widget>[AvatarWidget()],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearDatepicker(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        counter: Text('Caracteres ${_nombre.length}'),
        hintText: 'Nombre completo',
        labelText: 'Nombre y apellidos',
        helperText: 'Sólo nombre y apellido',
        suffixIcon: Icon(Icons.accessibility_new),
        icon: Icon(Icons.account_circle),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onChanged: (value) {
        setState(() {
          _nombre = value;
        });
      },
    );
  }

  _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        counter: Text('Caracteres ${_email.length}'),
        hintText: 'micorreo@correo.es',
        labelText: 'Correo',
        helperText: 'email',
        suffixIcon: Icon(Icons.email),
        icon: Icon(Icons.alternate_email),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        counter: Text('Caracteres ${_contrasena.length}'),
        labelText: 'Contraseña',
        helperText: 'no la compartas con nadie',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onChanged: (value) {
        setState(() {
          _contrasena = value;
        });
      },
    );
  }

  _crearDatepicker(BuildContext context) {
    return TextField(
        controller: _inputFieldDateController,
        enableInteractiveSelection: false,
        decoration: InputDecoration(
          labelText: 'Fecha nacimiento',
          helperText: 'dd/mm/yyyy',
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());

          _selectDate(context);
        });
  }

  _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Email es: $_email'),
      trailing: Text(_opcionSeleccionada),
    );
  }

  List<DropdownMenuItem<String>> _getOpcionesDropdown() {
    List<DropdownMenuItem<String>> list = new List();

    _poderes.forEach((poder) {
      list.add(DropdownMenuItem(
        value: poder,
        child: Text(poder),
      ));
    });

    return list;
  }

  Widget _crearDropdown() {
    return Row(children: <Widget>[
      Icon(Icons.select_all),
      SizedBox(
        width: 30,
      ),
      DropdownButton(
        value: _opcionSeleccionada,
        items: _getOpcionesDropdown(),
        onChanged: (opt) {
          setState(() {
            _opcionSeleccionada = opt;
          });
        },
      ),
    ]);
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }
}
