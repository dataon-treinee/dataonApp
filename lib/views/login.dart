import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;

import 'home.dart';

class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: login(context),
    );
  }
}

// desenha a tela
Widget login(BuildContext context) {
  var nome = TextEditingController();
  var cnpj = TextEditingController();
  var senha = TextEditingController();
  Utf8Codec bytes = new Utf8Codec();
  var authuser = bytes.encode('dataon:DataOnAPI@#');
  Base64Encoder b64 = new Base64Encoder();
  var bas64 = b64.convert(authuser);


  Future auth() async{

    Map<String,String> headers = {'Athorizathion': bas64};
    var response = await http.post('http://api.dataon.com.br/v1/api/user/Login?Login='+nome.text+"&Pass="+senha.text+'&Type=1&Doc='+cnpj.text,
      headers: headers
    );
  }

  return Stack(
    children: <Widget>[
      Container(
        padding: EdgeInsets.only(
            top:0,left: 0,right: 0,bottom: 70
        ),
        height: 300,
        alignment: Alignment(0.0,1.0),
        decoration: new BoxDecoration(
            image: new DecorationImage(
                alignment: Alignment(0.0,0.0),
                image: AssetImage("assets/logo3.png"),
                fit: BoxFit.contain
            ),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [1],
                colors:[
                  Color(0xFF343433)
                ]
            ),
            borderRadius: BorderRadius.only(
                topRight: Radius.zero,
                topLeft: Radius.zero,
                bottomRight: Radius.elliptical(200, 50),
                bottomLeft: Radius.elliptical(200, 50)
            )
        ),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.only(top: 250.0),
          height: 300,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                  Radius.circular(12)
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                    offset: Offset(
                        5.0,
                        5.0
                    )
                ),
              ]
          ),
          child:Container(
            margin: EdgeInsets.only(left: 12,right: 12),
            child: ListView(
              children: <Widget>[
                TextFormField(
                  autofocus: false,
                  controller: cnpj,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'CNPJ/CPF',
                      labelStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 15
                      )
                  ),
                  style: TextStyle(
                      fontSize: 15
                  ),
                ),
                TextFormField(
                  autofocus: false,
                  controller: nome,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Login',
                      labelStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 15
                      )
                  ),
                  style: TextStyle(
                      fontSize: 15
                  ),
                ),
                TextFormField(
                  autofocus: false,
                  controller: senha,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Senha',
                      labelStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 15
                      )
                  ),
                  style: TextStyle(
                      fontSize: 15
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:30),
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFF343433),
                    borderRadius: BorderRadius.all(
                        Radius.circular(20)
                    ),
                  ),
                  child: MaterialButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          'Entrar',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>Home(),
                      ));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ],
  );
}