import 'package:flutter/cupertino.dart';
import 'package:note_app_with_provider/models/note.model.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class NotesOperation with ChangeNotifier{
  List<Note> _notes= [];
  List<Note> get getNotes => _notes;

  NotesOperation(){
    addNewNote('title', 'description');
  }

  void addNewNote(String title, String desc){
    Note note = Note(title, desc);
    _notes.add(note);
    notifyListeners();
  }

  void getNote()async{
    try {
      var response = await http.get(Uri.parse('http://10.0.2.2:8080/api/test-note'));
      Map data = jsonDecode(response.body);


      List _temp = [];

      for (var i in data['data']) {
        _temp.add(i);
      }
      
      for (var i in _temp) {
        print(i);
        Note note = Note(i['title'], i['desc']);
       _notes.add(note);
      }

    } catch (e) {
      print(e);
      // return [];
    }
  }
}