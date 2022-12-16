import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List notes=[
    {
    "note":"This is my note",
    "image":"index.jpeg"
   },
   {
    "note":"This is my note",
    "image":"index.jpeg"
   },
   {
    "note":"This is my note",
    "image":"index.jpeg"
   },
   {
    "note":"This is my note",
    "image":"index.jpeg"
   },
    {
    "note":"This is my note",
    "image":"index.jpeg"
   },
    {
    "note":"This is my note",
    "image":"index.jpeg"
   },
    {
   "note":"This is my note",
    "image":"index.jpeg"
   },
    {
    "note":"This is my note",
    "image":"index.jpeg"
   },
    {
   "note":"This is my note",
    "image":"index.jpeg"
   },
   


  ];
  getuser(){
    var user =FirebaseAuth.instance.currentUser;
    print(user!.email);
  }
  void initState(){
    getuser();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
     return Scaffold(
     // backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Homepage"),
        actions: [
          IconButton(onPressed:()async{
            await FirebaseAuth.instance.signOut();
            Navigator.of(context).pushReplacementNamed("login");

          }
          , icon: Icon(Icons.exit_to_app),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),onPressed: (){
          Navigator.of(context).pushNamed("AddNotes");
        },),
      body:Container(
        
        child:ListView.builder(
          itemCount: notes.length,
          itemBuilder: ((context, i) {
          return Dismissible(key:Key("$i") , child: ListNotes(notes:notes[i],));
        }))
      ));
  }}
  class ListNotes extends StatelessWidget{
    final notes;
    ListNotes({this.notes});
    @override
    Widget build(BuildContext context){
        return Card(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Image.asset("images/note.png",fit: BoxFit.fill,)),
              Expanded(
                flex: 2,
                child: ListTile(
                  title:Text("Title"),
                  subtitle: Text("${notes['note']}"),
                  trailing: IconButton(icon:Icon(Icons.edit),onPressed: (){},),
                ),
              ),
            ],
          ),
        ); 
    }
  }