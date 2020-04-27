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
            _cardTipoA(),
            SizedBox(
              height: 10,
            ),
            _cardTipoB()
          ],
        ));
  }

  Card _cardTipoA() {
    return Card(
      elevation: 10,
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

  Card _cardTipoB() {
    return Card(
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
  }
}
