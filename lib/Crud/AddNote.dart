//import 'dart:js';

import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
       AppBar(
         backgroundColor: Theme.of(context).primaryColor,
        title: Container(
        
          padding: const EdgeInsets.only(top: 25),
          //alignment: Alignment.,
          child: TextFormField(
              maxLength: 40,
              minLines: 1,
              cursorWidth: 3,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                
                hintText: "Note Title",
                hintStyle: TextStyle(color: Colors.white,fontSize: 20),
                 border: InputBorder.none,
                 // border: OutlineInputBorder(borderSide:BorderSide(width: 0)),
              
              ),
            ),
        ),
        
      ),
      body:   SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(children: [
          Form(child:Column(children: [
            TextFormField(
             
              minLines: 1,
              maxLines: 20,
              decoration: InputDecoration(
                labelText: "my Note",
                border: InputBorder.none,
              
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 300),
              child: RaisedButton(
                color: Colors.deepPurple,
                onPressed: (){
      
              }, child:Text("add Note",style: TextStyle(fontSize: 20,color: Colors.white),)),
            ),
             //Padding(
             // padding: const EdgeInsets.only(top: 500),
              //child:
              RaisedButton(
                                color: Colors.deepPurple,

                onPressed: (){
               showBottomsheet();
              }, child:Text("add image",style: TextStyle(fontSize: 20,color: Colors.white),)),
            //)
          ],))
        ],)),
      ),
    );
    
  }
  showBottomsheet()
{
  //return showBottomsheet();


  return showModalBottomSheet(context: context,builder: (context){
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
       height: 180,
       child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
         children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Text("please add photo",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
           Row(children: [
            InkWell(
              onTap: (() {
                
              }),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Icon(Icons.photo_outlined,size: 30,),
                    SizedBox(height: 10,),
                    Text("Gallery",style: TextStyle(fontSize: 20),),
                  ],
                ),
              ),
            ),
              InkWell(
                onTap: (() {
                  
                }),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                  children: [
                    Icon(Icons.camera,size: 30,),
                    SizedBox(height: 10,),
                    Text("Camera",style: TextStyle(fontSize: 20),),
                  ],
                          ),
                ),
              )
           ],),
         ],
       )
      ),
    );
  });
}
  
  
}
