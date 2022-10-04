import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:note_app_with_provider/models/note.model.dart';
import 'package:note_app_with_provider/models/notesOperation.dart';
import 'package:note_app_with_provider/screen/addNote.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {

  NotesOperation? notesOperation;

  @override
  void initState(){
    print('asd');
    asd();
  }

  Future asd()async{
      try {
        var response = await http.get(Uri.parse('http://10.0.2.2:8080/api/test-note'));
        Map data = jsonDecode(response.body);

        List _temp = [];

        for (var i in data['data']) {
          _temp.add(i);
        }
        
        for (var i in _temp) {
          Provider.of<NotesOperation>(context, listen: false).addNewNote(i['title'], i['desc']);
        }
      } catch (e) {
        // return List x = [];
        print(e);
        return [];
      }
    }



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
      body: Consumer<NotesOperation>(
        builder: (context, NotesOperation data, child) {
          return ListView.builder(
            itemCount: data.getNotes.length,
            itemBuilder: (BuildContext context, i){
              return NoteCard(width: width, note: data.getNotes[i],);
            },

          );
        }
      ),
    );
  }
}

class NoteCard extends StatelessWidget {
  final Note note;
  

  const NoteCard({
    Key? key,
    required this.width,
    required this.note
  }) : super(key: key);

  final width;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Text("${note.title}", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 26),),
          Text("${note.desc}", style: TextStyle(fontSize: 16),)
        ],
      ),
    );
  }
}