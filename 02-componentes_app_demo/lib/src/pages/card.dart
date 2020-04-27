import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cards'),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          children: <Widget>[
            _cardWidget(),
            SizedBox( height: 20),
            _cardContainerBoxShadow(),
            SizedBox( height: 20),
            _cardWidget(),
            SizedBox( height: 20),
            _cardContainerBoxShadow(),
            SizedBox( height: 20),
            _cardWidget(),
            SizedBox( height: 20),
            _cardContainerBoxShadow(),
            SizedBox( height: 20),
            _cardWidget(),
            SizedBox( height: 20),
            _cardContainerBoxShadow(),
            SizedBox( height: 20),
          ],
        ));
  }

  Card _cardWidget() {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20) ),
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.only( top: 10, left: 10, right: 10 ),
            leading: Icon(Icons.album, color: Colors.blue[100], size: 35),
            title: Text('Primera carta'),
            subtitle: Text(
                'Modi laudantium perspiciatis quae sit laboriosam nulla quis corrupti adipisci. Sequi magnam placeat ad voluptates eum eum et ducimus quo.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardContainerBoxShadow() {
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(
                'https://www.yourtrainingedge.com/wp-content/uploads/2019/05/background-calm-clouds-747964.jpg'
            ),
            placeholder: AssetImage('assets/img/jar-loading.gif'),
            fadeInDuration: Duration( milliseconds: 200 ),
            height: 300,
            fit: BoxFit.cover
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('Cargando una imagen desde URL con loading'))
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: <BoxShadow> [
          BoxShadow(
            color: Colors.blue[200],
            offset: Offset(5.0, 5.0),
            spreadRadius: 4,
            blurRadius: 10
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: card
      ),

    );
  }
}
