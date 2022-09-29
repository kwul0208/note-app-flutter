import 'package:flutter/material.dart';
import 'package:note_app_with_provider/screen/addNote.dart';
class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size,height,width;

    // getting the size of the window
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddNote()));
        },
        child: Icon(Icons.add, size: 30, color: Colors.blueGrey,),
        backgroundColor: Colors.white,
      ),
      appBar: AppBar(
        title: Text("Task Manager notes"),
        backgroundColor: Colors.blueGrey,
        elevation: 0,
      ),
      body: Container(
        width: width,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        padding: EdgeInsets.all(15),
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("title", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 26),),
            Text("desc", style: TextStyle(fontSize: 16),)
          ],
        ),
      ),
    );
  }
}