import 'package:flutter/material.dart';

import 'package:flutter_vscode/src/pages/contador_page.dart';


class App extends StatelessWidget {

  @override
  Widget build( BuildContext context ) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: ContadorPage()
      ),
    );
  }

}