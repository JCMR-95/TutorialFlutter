import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:primerproyecto/detalles.dart';

void main() => runApp(MyApp());

TextEditingController _nombre = TextEditingController();
TextEditingController _rut = TextEditingController();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaginaPrincipal(),
    );
  }
}

class PaginaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Primera Aplicación",
      theme: ThemeData(
        primaryColor: Colors.green[800],
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Aplicación móvil JC'),
          ),
          body: Column(
            children: <Widget>[
              Center(
                child: Image(
                    image: NetworkImage(
                        'https://pluspng.com/img-png/wide-tree-png-tree-png-image-free-download-picture-tree-png-image-free-download-image-912.png')),
              ),
              TextBox1(),
              TextBox2(),
              RaisedButton(
                onPressed: () {
                  createRecord();
                },
                child:
                    const Text('Guardar Datos', style: TextStyle(fontSize: 20)),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context) => new SubPage()),
                  );
                },
                child: const Text('Ver Datos Guardados',
                    style: TextStyle(fontSize: 20)),
              ),
            ],
          )),
    );
  }
}

class TextBox1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _nombre,
      decoration: InputDecoration(labelText: 'Ingresa tu Nombre'),
    );
  }
}

class TextBox2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _rut,
      decoration: InputDecoration(labelText: 'Ingresa tu Rut'),
    );
  }
}

void createRecord() async {
  Firestore.instance
      .collection('registros')
      .document()
      .setData({'nombre': _nombre.text, 'rut': _rut.text});
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
