import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:noteapp/auth/Login.dart';
import 'package:noteapp/auth/Signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Crud/AddNote.dart';
import 'Home/HomePage.dart';
//import 'package:firebase_auth/firebase_auth.dart';
bool islogin=false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var user=FirebaseAuth.instance.currentUser;
  if(user==null){
   islogin=false;
  }else{
    islogin=true;
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      /*theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),*/
      home: islogin==false?const Login():HomePage(),
      routes: {
        "login":(context) => Login(),
        "Singup":(context) => Singup(),
        "HomePage":(context) => HomePage(),
        
        "AddNotes":(context) => AddNote(),

      },
      theme:ThemeData(
        primaryColor: Colors.deepPurple,
        buttonColor: Colors.deepPurple
        
      )

    
    );
  }
}

