import 'package:flutter/material.dart';

class AddNote extends StatelessWidget {
  const AddNote({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
        var size,height,width;

    // getting the size of the window
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        leading: GestureDetector(child: Icon(Icons.navigate_before),
        onTap: (){
          Navigator.pop(context);
        },
      ),
      title: Text("Add New Note"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Title",
                hintStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600
                )
              ),
              style: TextStyle(
                fontSize: 20
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Desc",
                hintStyle: TextStyle(
                  fontSize: 16,
                )
              ),
            ),
            SizedBox(height: height/2,),
            TextButton(
              onPressed: (){
                
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                backgroundColor: Colors.white,
              ),
              child: Text("Save", style: TextStyle(color: Colors.black),)
            )
          ],
        ),
      ),
    );
  }
}