import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State{
  final _formKey = GlobalKey<FormState>();
  int _width = 0;
  int _height = 0;
  int _area = 0;

  Widget build(BuildContext context) {
    return Form(key: _formKey,
              child: Column(children: <Widget>[
                Row(
                children: <Widget>[
                  Text('Ширина (мм):', style: TextStyle(fontSize: 16.0),),
                  Expanded(child: TextFormField(validator: (value){
                    if (value!.isEmpty) return 'Введите ширину';
                    _width = int.parse(value);
          }
         )),]
             ),

           SizedBox(height: 10.0),

           Row(
           children: <Widget>[
             Text('Высота (мм):', style: TextStyle(fontSize: 16.0),),
             Expanded(child: TextFormField(validator: (value){
                  if (value!.isEmpty) return 'Введите высоту';
                  _height = int.parse(value);
           }
           )),]),

           SizedBox(height: 10.0),

           ElevatedButton(
             style: ButtonStyle(
                 backgroundColor: MaterialStateProperty.all(Colors.blue),
               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                   RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(5),
                   )),
             ),
             onPressed: (){
             if(_formKey.currentState!.validate()) {
               setState(() {
                 _area = _width * _height;
               });
             }
             },
               child: Text('Вычислить', style: TextStyle(color: Colors.white),),
  ),
                SizedBox(height: 10.0),
                Text(_area == 0 ? 'задайте параметры' : 'S = $_width * $_height = ${_area} (мм)',
                  style: TextStyle(fontSize: 16.0),)
              ]));
  }
}

void main() => runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.blue,
                title: Text('Калькулятор площади',
                    style: TextStyle(
                      color: Colors.white,)
                )
            ),
            body: MyForm()
        )
    )
);