import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatars'),
        actions: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(
              'https://vignette.wikia.nocookie.net/animalcrossing/images/f/fc/Icono_Narciso_%28New_Horizons%29.png/revision/latest/top-crop/width/300/height/300?cb=20200321044240&path-prefix=es',
            ),
            backgroundColor: Colors.transparent,
          ),
          Container(
            margin: EdgeInsets.only(right: 10, left: 10),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://hardwaresfera.com/wp-content/uploads/2020/04/Narciso-Animal-Crossing-New-Horizons-Nintendo-Switch.png'),
          placeholder: AssetImage('assets/img/jar-loading.gif'),
          fadeInDuration: Duration( milliseconds: 200 ),
        ),
      )
    );
  }
}