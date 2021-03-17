import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Page')
      ),
      body: Container(
        padding: EdgeInsets.only(top:40.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: _crearImagen()
            ),
            SizedBox(height: 30.0),
            _crearSlider(),
            SizedBox(height: 30.0)
          ],
        )
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      onChanged: (valor) {
        setState(() {
          _valorSlider = valor; 
        });
      },
      activeColor: Colors.indigoAccent,
      value: _valorSlider,
      divisions: 20,
      min: 10,
      max: 600
    );
  }

  Widget _crearImagen(){
    return Image(
      image: NetworkImage('https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwallpapertag.com%2Fwallpaper%2Ffull%2Fe%2F1%2Fc%2F889472-rezero-wallpapers-1920x1200-for-mobile-hd.jpg&f=1&nofb=1'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

}