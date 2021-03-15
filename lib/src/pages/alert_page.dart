import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ALERT PAGE'),
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.blue,
          child: Text('Mostrar alerta'),
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _mostarAlerta(context), 
        )
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.beach_access_outlined),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostarAlerta(BuildContext context){
    showDialog(
      context: context, 
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        title: Text('Titulo'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Esto es el contenido de una alerta'),
            FlutterLogo(size:100)
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancelar')
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Ok')
          )
        ],
      )
    );
  }

}