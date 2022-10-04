import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:note_app_with_provider/models/notesOperation.dart';
import 'package:provider/provider.dart';


class AddNote extends StatefulWidget {
  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  // const AddNote({ Key? key }) : super(key: key);
    TextEditingController _titleController = TextEditingController();

    TextEditingController _descController = TextEditingController();

    @override
    void initState(){
      super.initState();
      // asd();
    }

    // Future asd()async{
    //   try {
    //     var response = await http.get(Uri.parse('http://10.0.2.2:8080/api/test-note'));
    //     Map data = jsonDecode(response.body);


    //     List _temp = [];

    //     for (var i in data['data']) {
    //       _temp.add(i);
    //     }
    //   // print(_temp);
        
    //     for (var i in _temp) {
    //       Provider.of<NotesOperation>(context, listen: false).addNewNote(i['title'], i['desc']);
    //     }
    //   } catch (e) {
    //     // return List x = [];
    //     print(e);
    //     return [];
    //   }
    // }

  @override
  Widget build(BuildContext context) {
    // String titleTxt;
    // String descTxt;



    var size,height,width;

    // getting the size of the window
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    // print();
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
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
                controller: _titleController,
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
                controller: _descController,
              ),
              SizedBox(height: height/2,),
              TextButton(
                onPressed: (){
                  Provider.of<NotesOperation>(context, listen: false).addNewNote(_titleController.text, _descController.text);
                  Navigator.pop(context);
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
      ),
    );
  }
}