import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: CircleAvatar(
        backgroundImage: NetworkImage(
            'https://vignette.wikia.nocookie.net/animalcrossing/images/f/fc/Icono_Narciso_%28New_Horizons%29.png/revision/latest/top-crop/width/300/height/300?cb=20200321044240&path-prefix=es'),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
