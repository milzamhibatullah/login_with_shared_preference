
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Constants.dart';
class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login>{
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var _validate = false;

  void _login() async{
     setState(() {
      emailController.text.isEmpty && passwordController.text.isEmpty?
          _validate=true
          : _validate=false;
    });

   if(_validate!=true){ _setPreferences();}
  }

  void _setPreferences() async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString(constant.emailUser, emailController.text);
      pref.setBool(constant.isLoggedin, true);
      //cek main.dart untuk routes
      Navigator.pushReplacementNamed(context, '/dashboard');
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Selamat Datang', style: TextStyle(color: Colors.white),),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 14.0),
                    child: Text(
                      'Masuk Akun',
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 24.0),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Belajar penggunaan shared preference',
                      style: TextStyle(color: Colors.grey,fontSize: 14.0),
                    ),
                  ),
                  Container(
                      child:TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          fillColor: Colors.grey,
                          labelText: 'Email atau Username',
                            errorText: _validate==true?'Field tidak boleh kosong':null,
                        ),
                      )
                  ),
                  Container(
                      child:TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: Colors.grey,
                          labelText: 'Password',
                          errorText: _validate==true?'Field tidak boleh kosong':null,
                        ),
                      )
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                    child: Center(
                      child: ButtonTheme(
                        minWidth: 120.0,
                        height: 50.0,
                        child:  RaisedButton(
                          color: Colors.blue,
                          onPressed: _login,
                          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white,fontSize: 18.0),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}