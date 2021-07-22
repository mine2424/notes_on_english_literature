import 'dart:io';

import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:notes_on_english_literature/domain/notes/models/note.dart';

class NotesRepository {
  NotesRepository();

  final _db = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  // ============== firestore CRUD functions area ===============

  Future<Result<String>> addNoteImageForStorage(String path, File file) async {
    late final TaskSnapshot snapshot;

    try {
      snapshot = await _storage.ref(path).putFile(file);
    } on Exception catch (e) {
      print(e);
      return Result.error('error');
    }

    return Result.value(await snapshot.ref.getDownloadURL());
  }

  Future<Result<Note>> addNoteListForDB(
    Note note,
  ) async {
    final doc = _db.doc(
      'private/users/users_v1/${note.uid}/myNoteLists/writeOnly/v1/${note.noteId}',
    );

    try {
      doc.set(note.toMap(), SetOptions(merge: true));
    } on Exception catch (e) {
      return Result.error(e);
    }

    return Result.value(note);
  }

  Future<Result<List<Note>>> fetchNoteListForDB(String uid) async {
    late QuerySnapshot snapshot;

    final col = _db.collection(
      'private/users/users_v1/$uid/myNoteLists/readOnly/v1',
    );

    try {
      snapshot = await col.get();
    } on Exception catch (e) {
      return Result.error(e);
    }

    final data = <Note>[];

    for (final doc in snapshot.docs) {
      final docData = doc.data()! as Map<String, dynamic>;

      data.add(Note.fromMap(docData));
      print(docData);
    }

    return Result.value(data);
  }

  Future<Result<void>> updateNoteListForDB(
    Note note,
  ) async {
    final doc = _db.doc(
      'private/users/users_v1/${note.uid}/myNoteLists/writeOnly/v1/${note.noteId}/',
    );

    try {
      doc.set(note.toMap(), SetOptions(merge: true));
    } on Exception catch (e) {
      return Result.error(e);
    }

    return Result.value('updated');
  }

  Future<Result<void>> deleteNoteListForDB(
    String uid,
    String noteId,
  ) async {
    final doc = _db.doc(
      'private/users/users_v1/$uid/myNoteLists/writeOnly/v1/$noteId/',
    );

    try {
      await doc.delete();
    } on Exception catch (e) {
      return Result.error(e);
    }

    return Result.value('deleted');
  }
}

  // ============ this is local DB area ==============================

//   Future<void> initialized() async {
//     await getApplicationDocumentsDirectory().then((dir) {
//       store = Store(
//         getObjectBoxModel(),
//         directory: dir.path + '/objectbox',
//       );
//       box = Box<Note>(store!);
//     });
//   }
//
//   Future<void> addUpdateNoteListForLocalDB(Note note) async {
//     await initialized();
//     box!.put(note);
//   }
//
//   Future<List<Note>> fetchNoteListForLocalDB() async {
//     await initialized();
//     return box!.getAll();
//   }
//
//   Future<Result<Note>> fetchNoteForLocalDB(int id) async {
//     await initialized();
//     if (!box!.contains(id)) {
//       return Result.error('error');
//     }
//
//     print('fetchNote Re: ${box!.get(id)!}');
//
//     return Result.value(box!.get(id)!);
//   }
//
//   Future<void> deleteNoteListForLocalDB(int id) async {
//     await initialized();
//     box!.remove(id);
//   }
//
//   void dispose() {
//     store!.close();
//   }
// }

