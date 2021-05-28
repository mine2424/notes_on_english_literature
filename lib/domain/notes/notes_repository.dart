import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';

import 'package:notes_on_english_literature/domain/notes/models/note.dart';
import 'package:notes_on_english_literature/objectbox.g.dart';

class NotesRepository {
  NotesRepository();

  Store? store;
  final _db = FirebaseFirestore.instance;

  Future<void> _initializingObjectBox() async {
    await getApplicationDocumentsDirectory().then((Directory dir) {
      store = Store(getObjectBoxModel(), directory: dir.path + '/objectbox');
    });
  }

  Future<void> addUpdateNoteListForLocalDB(Note note) async {
    await _initializingObjectBox();
    final box = store!.box<Note>();

    box.put(note, mode: PutMode.put);
    store!.close();
    return;
  }

  Future<List<Note>> fetchNoteListForLocalDB() async {
    await _initializingObjectBox();
    final box = store!.box<Note>();

    print(box.getAll());
    return box.getAll();
  }

  Future<void> deleteNoteListForLocalDB() async {
    await _initializingObjectBox();
    final box = store!.box<Note>();
    store!.close();
  }
}
