import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

 final myController = TextEditingController();
 final myGlobalController = GlobalKey<FormState>();

  

class User{
  final int userId;
  final String name;
  final String username;
  final String email;
  final String phone;

  User({this.userId, this.name, this.username,this.email, this.phone});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      userId: json['userId'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
    );
  }
}

/*
Future<User> FetchUser() async{
  final response = await http.get(
    'http://jsonplaceholder.typicode.com/users/' + userId);

    if(response.statusCode == 200)
      return User.fromJson(json.decode(response.body));
    

}
*/


void main() => runApp(MaterialApp(
  title: 'Final App',
  theme: ThemeData(
  primarySwatch: Colors.blue),
  home: new Final_App()
));

class Final_App extends StatelessWidget {
 
@override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Bryan Romero'),),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,

          
          children: <Widget>[
            Text('Aplicaciones Mobiles',style: TextStyle(
              inherit: true, 
              color: Colors.blue[300],
              fontSize: 25.0),),
              Image.asset('assets/udla.png'),
              RaisedButton(
            onPressed: (){
              Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) => SecondScreen()));
      }, 
      child: Text('Ingresar a WebServices'),),

      RaisedButton(
            onPressed: (){
              Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) => ThirdScreen()));
      }, 
      child: Text('Sobre Flutter'),)
          ],),),
    );
    }
  }

      





class SecondScreen extends StatelessWidget{ 

final _name_to_show_controller  = TextEditingController();

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('WEB SERVICES'),),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Existen 10 Usuarios en la Base de Datos, por favor ingrese un numero del 1 al 10',
              style: TextStyle(
              inherit: true, 
              color: Colors.blue[300],
              fontSize: 20.0),),

            TextField(decoration: InputDecoration(hintText: 'Ingrese un numero'),
            controller: _name_to_show_controller,),
            
            RaisedButton(
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> FourthScreen(userId: _name_to_show_controller.text)));
              },
              child: Text('Solicitar Datos'),
            ),
      ],)
    )); 
  }
 }








class ThirdScreen extends StatelessWidget{
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('Sobre Flutter'),),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,

          
          children: <Widget>[
            Text('FRAMEWORK = FLUTTER',style: TextStyle(
              inherit: true, 
              color: Colors.black,
              fontSize: 20.0),),
              Text('Lenguaje = DART',style: TextStyle(
              inherit: true, 
              color: Colors.black,
              fontSize: 15.0),),
              Image.asset('assets/flutter.jpg'),
              Image.asset('assets/dart.jfif'),
              Image.asset('assets/VC.jpg'),
      ],),),
    );
  }

}

class FourthScreen extends StatelessWidget{
 
 final String userId;

Future<User> FetchUser() async{
  final response = await http.get(
    'http://jsonplaceholder.typicode.com/users/' + userId);

    if(response.statusCode == 200)
      return User.fromJson(json.decode(response.body));
    

}

FourthScreen ({Key key,@required this.userId}): super(key: key);

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('USUARIO'),),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,

          
          children: <Widget>[

            FutureBuilder<User>(
              future: FetchUser(),
              builder: (context, snapshot) {

                  if(snapshot.hasData){
                    
                    String name = snapshot.data.name;
                    String username = snapshot.data.username;
                    String email = snapshot.data.email;
                    String phone = snapshot.data.phone;
                    
                    return Column(mainAxisAlignment: MainAxisAlignment.center,
                     children:<Widget>[
                      
                     
                        Text('Nombre: $name'),
                        Text('Usuario: $username'),
                        Text('Email: $email'),
                        Text('Telefono: $phone'),

                        
                    ],  );
                  }
                  else if(snapshot.hasError)
                    return Text(snapshot.error);

                  return CircularProgressIndicator();                   
              },
            ),

            RaisedButton(
              onPressed: (){

            Navigator.push(
              context, MaterialPageRoute(
                builder: (context) => SecondScreen()
              )
            );
         }, child: Text('Regresar'),)
      ],),),
    );
  }

}





