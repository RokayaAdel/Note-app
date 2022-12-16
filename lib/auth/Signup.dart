import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Singup extends StatefulWidget {
  const Singup({Key? key}) : super(key: key);

  @override
  State<Singup> createState() => _SingupState();
}

class _SingupState extends State<Singup> {
  var username,email,password,phone;
  GlobalKey<FormState> formrstate=new GlobalKey<FormState>();
  signUp() async{
    var formrdata= formrstate.currentState;
    if(formrdata!.validate()){
    formrdata.save();
    try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
    
    
  );
  return credential;
  print("RRRRRRRRR");
  print(credential);
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
   /* AwesomeDialog(context: context,
        title: "Error",
        body: Text("weak-password")
    );*/
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
   /*  AwesomeDialog(context: context,
        title: "Error",
        body: Text("The account already exists for that email.")
    );*/
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
    }
    else{
      print("not valid");
    }

  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
     // backgroundColor: Colors.white70,
       resizeToAvoidBottomInset: true,
      body:
      SingleChildScrollView(
        child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
          children: [
            SizedBox(height: 100,),
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
                  key: formrstate,
                  child:Column(children: [
                  TextFormField(
                    onSaved: ((value) {
                      username=value;
                      
                    }),
                    validator: ((value) {
                      if(value!.length >100){
                        return "username can't be more than 100 letters";

                      }
                      if(value.length <2){
                        return "username can't be less than 2 letter";
                      }
                      return null;
                    }),
              
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "UserName",
                      border: OutlineInputBorder(borderSide:BorderSide(width: 1) )
                    ),
                  ),
                  SizedBox(height:20),
                  TextFormField(
                    onSaved: ((value) {
                      email=value;
                      
                    }),
                     validator: ((value) {
                      if(value!.length >100){
                        return "Email can't be more than 100 letters";

                      }
                      if(value.length <2){
                        return "Email can't be less than 2 letter";
                      }
                      return null;
                    }),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: "Email",
                      border: OutlineInputBorder(borderSide:BorderSide(width: 1) )
                    ),
                  ),
                  SizedBox(height:20),
                  TextFormField(
                    onSaved: ((value) {
                      password=value;
                      
                    }),
                     validator: ((value) {
                      if(value!.length >100){
                        return "Passward can't be more than 100 letters";

                      }
                      if(value.length <4){
                        return "Passwardcan't be less than 2 letter";
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
                  SizedBox(height:20),
                  TextFormField(
                    onSaved: (value) {
                      phone=value;
                    },
                     validator: ((value) {
                      if(value!.length >11){
                        return "Passward can't be more than 11 number";

                      }
                      if(value.length <11){
                        return "Passwardcan't be less than 11 number";
                      }
                      return null;
                    }),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      hintText: "phone",
                      border: OutlineInputBorder(borderSide:BorderSide(width: 1) )
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child:Row(
                      children: [
                        Text("if you have an acccount",style: TextStyle(fontSize: 18)),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed("login");
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
                       final response= await signUp();
                       if(response!=null){
                        Navigator.of(context).pushReplacementNamed("HomePage");
                       }
                       /**/
                      },
                       child: Text("Sign Up",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                  )
                ],
                )
                ),
              ),
           
           
        ],),
      )
      
     
     );


    
  }
}