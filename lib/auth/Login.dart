//import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
   var password,email;
  late final credential;
  GlobalKey<FormState>form=new GlobalKey<FormState>();
  Login()async{
    var formdata= form.currentState;
    if(formdata!.validate()){
      formdata.save();
      try  {
  credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
   email: email,
    password:password,
  );
  return credential;
  print(credential.user?.emailVerified);
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
  if(credential.user?.emailVerified==false){
    User? user =FirebaseAuth.instance.currentUser;
    await user!.sendEmailVerification();
  }
}

    }

  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
     // backgroundColor: Colors.white70,
      body:
      ListView(
        children:[
          SizedBox(height: 100,),
           Column(
              mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Center(
            
                 
                    child: Container(
                     width: 200,
                  
                     //height: 300,
                     /* decoration: BoxDecoration(
                        color: Colors.black,
                       borderRadius: BorderRadius.circular(20)
                       
                      ),*/
                     child: Image.asset("images/note2.jpg")
                      //),
                    ),
                 
              ),
      
        
          
            Container(
              padding: EdgeInsets.all(20),
              child: Form(
                key: form,
                child:Column(children: [
                TextFormField(
                  onSaved: (value) {
                    email=value;
                  },
                  validator: ((value) {
                        if(value!.length >100){
                          return "email can't be more than 11 number";
      
                        }
                        if(value.length <4){
                          return "email can't be less than 11 number";
                        }
                        return null;
                      }),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: "email",
                    border: OutlineInputBorder(borderSide:BorderSide(width: 1) )
                  ),
                ),
                SizedBox(height:20),
                TextFormField(
                  onSaved: (value) {
                    password=value;
                  },
                   validator: ((value) {
                        if(value!.length >100){
                          return "Passward can't be more than 11 number";
      
                        }
                        if(value.length <2){
                          return "Passwardcan't be less than 11 number";
                        }
                        return null;
                      }),
                  obscureText: true,
                  decoration: const InputDecoration(
                    prefixIcon:Icon(Icons.password),
                      hintText:"Passward",
                    border: OutlineInputBorder( 
                      borderSide: BorderSide(width: 1)
                    )
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child:Row(
                    children: [
                      Text("if you haven't an acccount",style: TextStyle(fontSize: 18)),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed("Singup");
                        },
                        child: Text("Click here",style: TextStyle(color: Colors.blue,fontSize: 18),),
                      )
                    ],
                  )
      
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                  // color: Colors.blue,
                   textColor: Colors.white,
                    onPressed:() async {
                      final response=await Login();
                      if (response!=null){
                       Navigator.of(context).pushReplacementNamed("HomePage");
                    }
                      },
                                          
                     child: Text("Login",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                )
              ],)
              ),
            )
           
        ],),
     ] )
      
     
     );


    
  }
}