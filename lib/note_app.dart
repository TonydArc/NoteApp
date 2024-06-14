import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/note.dart';
import 'model/note_database.dart';

class NoteApp extends StatefulWidget {
  const NoteApp({Key? key}) : super(key: key);

  @override
  _NoteAppState createState() => _NoteAppState();
}

class _NoteAppState extends State<NoteApp> {
  final textCTRL = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      readNote();
    });
  }

  void createNote() {
    showDialog(
      context: context,
      builder: (context) => Theme(
        data: Theme.of(context).copyWith(dialogBackgroundColor: Colors.black),
        child: AlertDialog(
          content: TextField(
            controller: textCTRL,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: 'Enter note',
              hintStyle: TextStyle(color: Colors.white54),
            ),
          ),
          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child:
                  const Text('Cancel', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              child:
                  const Text('Create', style: TextStyle(color: Colors.white)),
              onPressed: () {
                context.read<NoteDatabase>().addNote(textCTRL.text);
                textCTRL.clear();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void readNote() {
    Provider.of<NoteDatabase>(context, listen: false).fetchNote();
  }

  void updateNote(Note note) {
    textCTRL.text = note.text;
    showDialog(
      context: context,
      builder: (context) => Theme(
        data: Theme.of(context).copyWith(dialogBackgroundColor: Colors.black),
        child: AlertDialog(
          title: const Text('Update', style: TextStyle(color: Colors.white)),
          content: TextField(
            controller: textCTRL,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: 'Enter new note',
              hintStyle: TextStyle(color: Colors.white54),
            ),
          ),
          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child:
                  const Text('Cancel', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              child:
                  const Text('Update', style: TextStyle(color: Colors.white)),
              onPressed: () {
                context.read<NoteDatabase>().updateNote(note.id, textCTRL.text);
                textCTRL.clear();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void deleteNote(int id) {
    context.read<NoteDatabase>().deleteNote(id);
  }

  @override
  Widget build(BuildContext context) {
    final noteDatabase = context.watch<NoteDatabase>();

    List<Note> currentNotes = noteDatabase.currentNote;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 57, 57, 57),
        onPressed: createNote,
        child: const Icon(
          Icons.add,
          color: Color.fromARGB(255, 103, 21, 246),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.black,
              centerTitle: true,
              expandedHeight: 75.0,
              floating: true,
              pinned: false,
              title: const Text(
                'All Notes',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final note = currentNotes[index];
                  return Container(
                    child: Card(
                      color: const Color.fromARGB(255, 101, 99, 99),
                      child: ListTile(
                        title: Text(
                          note.text,
                          style: const TextStyle(color: Colors.white),
                        ),
                        trailing: PopupMenuButton<String>(
                          iconColor: Colors.white,
                          color: Colors.black,
                          onSelected: (String result) {
                            if (result == 'update') {
                              updateNote(note);
                            } else if (result == 'delete') {
                              deleteNote(note.id);
                            }
                          },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            const PopupMenuItem<String>(
                              value: 'update',
                              child: Text(
                                'Update',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            const PopupMenuItem<String>(
                              value: 'delete',
                              child: Text(
                                'Delete',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                childCount: currentNotes.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
