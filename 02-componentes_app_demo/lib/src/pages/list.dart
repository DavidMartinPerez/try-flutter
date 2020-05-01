import 'dart:async';

import 'package:flutter/material.dart';
import 'package:componentes_app_demo/src/widget/avatar.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool loading = false;

  // Se ejecuta cuando se inicia el estado
  @override
  void initState() {
    super.initState();

    _agregarMas(10);

    _scrollController.addListener( () {

      if( _scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        print('Final de la lista');
        _fetchData();
      }

    });
  }

  //Se ejecuta el destruirse el componente
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas & Infinite Scroll'),
        actions: <Widget>[
          AvatarWidget()
        ],
      ),
      body: Stack(
        //Stack apila en index z
        children: <Widget>[
          _crearLista(),
          _crearLoading(),
        ],
      )
    );
  }

  Future<Null> obtenerPaginaNuevaPagina() async {
    final duration = Duration(seconds: 2);

    new Timer( duration, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregarMas(10);
    });

    return Future.delayed(duration);
  }


  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: obtenerPaginaNuevaPagina,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          final image = _listaNumeros[index];
          return FadeInImage(
            image: NetworkImage('https://i.picsum.photos/id/$image/500/300.jpg'),
            placeholder: AssetImage('assets/img/jar-loading.gif'),
          );
        },
      ),
    );
  }

  Widget _crearLoading() {
    if( loading ) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 25),
                child: CircularProgressIndicator(
                  backgroundColor: Colors.red[50],
                )
              )
            ],
          )
        ],
      );
    } else {
      return Container();
    }
  }

  void _agregarMas( int numeroDeFotos ) {
    for (var i = 0; i < numeroDeFotos; i++) {
      _ultimoItem++;
      setState(() {
        _listaNumeros.add( _ultimoItem );
      });
    }
  }

  Future _fetchData() async {
    setState(() {
      loading = true;
    });

    final duration = Duration( seconds: 2);

    new Timer(
      duration,
      response
    );
  }

  void response() {
    loading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration( milliseconds: 250 )
    );

    _agregarMas(5);
  }
}