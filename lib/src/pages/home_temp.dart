import 'package:flutter/material.dart';

class HomeTemp extends StatelessWidget {
  
  final List<String> numeros = ['Uno','Dos','Tres','Cuatro','Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Temp')
      ),
      body: ListView(
        children: _crearItems()
      )
    );
  }

  List<Widget> _crearItems(){
    return numeros.map( (numero) =>
      Column(
      children: <Widget>[
        ListTile(
          title: Text(numero),
          subtitle: Text('Descripcion'),
          leading: Icon(Icons.add_to_queue_rounded),
          trailing: Icon(Icons.arrow_forward_ios_outlined),
          onTap: (){},
        ),
        Divider()
        ]
      )
    ).toList();
  }

}