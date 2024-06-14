import 'package:flutter/material.dart';
import 'package:flutter_buoi1/model/note.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase extends ChangeNotifier {
  static late Isar isar;

  // initialize database
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([NoteSchema], directory: dir.path);
  }

  // list of notes
  final List<Note> currentNote = [];

  // create
  Future<void> addNote(String newText) async {
    final newNote = Note()..text = newText;
    // create new note
    await isar.writeTxn(() => isar.notes.put(newNote));
    // reload db
    fetchNote();
  }

  // read
  Future<void> fetchNote() async {
    List<Note> allNote = await isar.notes.where().findAll();
    currentNote.clear();
    currentNote.addAll(allNote);
    notifyListeners();
  }

  // update
  Future<void> updateNote(int id, String newText) async {
    final note = await isar.notes.get(id);

    if (note != null) {
      note.text = newText;
      await isar.writeTxn(() => isar.notes.put(note));
      await fetchNote();
    }
  }

  // delete
  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNote();
  }
}
