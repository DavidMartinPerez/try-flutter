import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider();

  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('assets/json_data/menu_opts.json');

    return opciones = json.decode( resp )['rutas'];
  }
}


final menuProvider = new _MenuProvider();
