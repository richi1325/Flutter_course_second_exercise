import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  ScrollController _scrollController = new ScrollController();


  List<int> _listaNumeros = new List();
  int _ultimoNumero = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregar10();
    _scrollController.addListener((){
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        _fecthData();
      }

     }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LISTVIEW PAGE')
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading()
        ],
      )
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
        onRefresh: _obtenerPagina,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: _listaNumeros.length,
          itemBuilder: (BuildContext context, int index){
            return FadeInImage(
              image: NetworkImage('https://picsum.photos/500/400/?image=${_listaNumeros[index]}'),
              placeholder: AssetImage('assets/jar-loading.gif'),
            );
          },
        ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _agregar10(){

    for (int i=0; i<10;i++){
      _ultimoNumero++;
      _listaNumeros.add(_ultimoNumero);

    }

    setState(() {
      
    });

  }

  Future _fecthData() async {
    _isLoading = true;
    setState(() {
      
      final duration = new Duration(
        seconds: 2
      );

      return new Timer(duration,_respuestaHTTP);

    });
  }

  void _respuestaHTTP(){
    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels+100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 200)
    );
    _agregar10();
    
  }

  Widget _crearLoading() {

    if(_isLoading){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
          SizedBox(height: 15.0)

        ],
      );
    }else{
      return Container();
    }

  }

  Future<void> _obtenerPagina() async {
    
    final duration = new Duration(milliseconds: 1200);
    new Timer(duration, (){
      _listaNumeros.clear();
      _ultimoNumero++;
      _agregar10();
    });

    return Future.delayed(duration);

  }

}
