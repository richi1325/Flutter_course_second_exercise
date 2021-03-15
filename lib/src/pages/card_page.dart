import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cards Page'),
        ),
        body: ListView(
          padding: EdgeInsets.all(20.0),
          children: <Widget>[
            _cardTipo1(),
            SizedBox(height: 30.0),
            _cardTipo2()
          ]
        )
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 12.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0) 
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album,color:Colors.blue),
            title: Text('Soy un título pro'),
            subtitle: Text('Esto es una descripcion bien pro'),
          ), 
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: Text('Cancelar'),
                onPressed: (){

                },
              ),
              TextButton(
                child: Text('Ok'),
                onPressed: (){}
              )
            ],
          )
        ]
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage('https://www.nexofin.com/archivos/2017/04/483184883_1000x666-750x450.jpg'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 250.0,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Esto es una imagen')
          )
        ],
      )
    );

    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40.0),
        child: card
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow( 
              color: Colors.black26,
              blurRadius: 5.0,
              spreadRadius: 2.3,
              offset: Offset(2.0,-5.0)
          )
        ]
      ),

    );
  }

}