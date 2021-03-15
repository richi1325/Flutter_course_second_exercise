import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AVATAR PAGE'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            child: CircleAvatar(
              backgroundImage:  NetworkImage('https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Ftumamifero.com%2Fwp-content%2Fuploads%2F2018%2F03%2Fgato-egipcio-18-1024x768.jpg&f=1&nofb=1'),
              radius: 20.0,
            ),
          ),

          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.purpleAccent,
            )
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.diarioveterinario.com%2Fimages%2Fshowid2%2F2239201%3Fw%3D900&f=1&nofb=1'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        )
      ),
    );
  }
}