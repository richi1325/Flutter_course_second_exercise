import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  
  String _nombre = '';
  String _email = '';
  String _fecha = '';
  List _poderes = ['Volar','RayosX','Super Fuerza'];

  String _poderSeleccionado = 'Volar';


  TextEditingController _inputFechaController = new TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Page') 
      ),
      body: ListView(
        padding: EdgeInsetsDirectional.all(20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropDown(),
          Divider(),
          _crearPersona()
        ],
      )
    );
  }

  Widget _crearInput() {
    return TextField(
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0) 
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Si tienes más de un nombre de igual forma colócalo',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle_outlined)
        
      ),
      onChanged: (valor){
        setState(() {
          
          valor = valor.toUpperCase();
          _nombre = valor;  

        });
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0) 
        ),
        hintText: 'user@cantilever.com.mx',
        labelText: 'Email',
        helperText: 'Correo Empresarial',
        icon: Icon(Icons.alternate_email_sharp)
      ),
      onChanged: (valor) => setState(() {
          _email = valor;  
      })
      
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0) 
        ),
        hintText: 'Contraseña',
        labelText: 'Contraseña',
        icon: Icon(Icons.lock_rounded)
      ),  
      onChanged: (valor) => setState(() {
          //_email = valor;  
      })
      
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFechaController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0) 
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'fecha de nacimiento',
        icon: Icon(Icons.date_range_outlined)
        ),
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context);
        },
            
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2025),
      locale: Locale('es','MX')
    );
    if(picked!=null){
      setState(() {
        _fecha = picked.toString();
        _inputFechaController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
        
        List<DropdownMenuItem<String>> lista = new List();

        _poderes.forEach((poder) {
          lista.add(DropdownMenuItem(
            child: Text(poder),
            value: poder,
          ));
        });
        
        return lista;

    }


  Widget _crearDropDown(){

    return DropdownButton(
      value: _poderSeleccionado,
      items: getOpcionesDropdown(),
      onChanged: (option){
        setState(() {
          _poderSeleccionado = option ;
        });
      },
    );

  }

  Widget _crearPersona(){
    return ListTile(
      title: Text('Nombre: $_nombre'),
      subtitle: Text('Email: $_email'),
    );
  }

}