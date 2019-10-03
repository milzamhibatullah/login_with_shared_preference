import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login_shared_preference/ui/Login.dart';
import 'package:login_shared_preference/ui/Dashboard.dart';
import 'Constants.dart';
void main()=>runApp(MainApp());
class MainApp extends StatefulWidget{
 @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainAppState();
  }
}

class MainAppState extends State<MainApp>{
  var isLogin;
  void _checkPref() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      isLogin = pref.getBool(constant.isLoggedin);
    });
  }


  @override
  void initState() {
    _checkPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => isLogin == true?Dashboard():Login() ,
        '/dashboard':(context)=>Dashboard()

      },
    );
  }
}