// GENERATED CODE - DO NOT MODIFY BY HAND

// Currently loading model from "JSON" which always encodes with double quotes
// ignore_for_file: prefer_single_quotes
// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';

import 'domain/notes/models/note.dart';
import 'domain/notes/models/note_list.dart';
import 'domain/notes/models/sentence.dart';
import 'pages/app/states/app_state.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

ModelDefinition getObjectBoxModel() {
  final model = ModelInfo.fromMap({
    "entities": [
      {
        "id": "1:1462653170498243876",
        "lastPropertyId": "2:2220080956132263304",
        "name": "AppState",
        "properties": [
          {
            "id": "1:746379728978253425",
            "name": "id",
            "type": 6,
            "flags": 1,
            "dartFieldType": "int"
          },
          {
            "id": "2:2220080956132263304",
            "name": "isLoading",
            "type": 1,
            "dartFieldType": "bool"
          }
        ],
        "relations": [],
        "backlinks": [],
        "constructorParams": ["themeMode named", "isLoading named", "id named"],
        "nullSafetyEnabled": true
      },
      {
        "id": "4:4129672664802033205",
        "lastPropertyId": "1:1735588225475401317",
        "name": "NoteList",
        "properties": [
          {
            "id": "1:1735588225475401317",
            "name": "id",
            "type": 6,
            "flags": 1,
            "dartFieldType": "int"
          }
        ],
        "relations": [],
        "backlinks": [],
        "constructorParams": ["noteList named", "id named"],
        "nullSafetyEnabled": true
      },
      {
        "id": "5:8366181238560735452",
        "lastPropertyId": "3:6164772861049343954",
        "name": "Note",
        "properties": [
          {
            "id": "1:3517216062718913126",
            "name": "id",
            "type": 6,
            "flags": 1,
            "dartFieldType": "int"
          },
          {
            "id": "2:3287509733782886562",
            "name": "title",
            "type": 9,
            "dartFieldType": "String"
          },
          {
            "id": "3:6164772861049343954",
            "name": "imageUrl",
            "type": 9,
            "dartFieldType": "String"
          }
        ],
        "relations": [],
        "backlinks": [],
        "constructorParams": [
          "title named",
          "imageUrl named",
          "sentenceList named",
          "id named"
        ],
        "nullSafetyEnabled": true
      },
      {
        "id": "6:7080524811407016804",
        "lastPropertyId": "6:646529916350438874",
        "name": "Sentence",
        "properties": [
          {
            "id": "1:3658573425521014314",
            "name": "id",
            "type": 6,
            "flags": 1,
            "dartFieldType": "int"
          },
          {
            "id": "2:5093136888151983766",
            "name": "naturalSentence",
            "type": 9,
            "dartFieldType": "String"
          },
          {
            "id": "3:5027577073882375473",
            "name": "structedSentence",
            "type": 9,
            "dartFieldType": "String"
          },
          {
            "id": "4:385265629342532950",
            "name": "transration",
            "type": 9,
            "dartFieldType": "String"
          },
          {
            "id": "5:4530850885473351735",
            "name": "grammerMemo",
            "type": 9,
            "dartFieldType": "String"
          },
          {
            "id": "6:646529916350438874",
            "name": "watchCount",
            "type": 6,
            "dartFieldType": "int"
          }
        ],
        "relations": [],
        "backlinks": [],
        "constructorParams": [
          "naturalSentence named",
          "structedSentence named",
          "transration named",
          "grammerMemo named",
          "author named",
          "watchCount named",
          "id named"
        ],
        "nullSafetyEnabled": true
      }
    ],
    "lastEntityId": "6:7080524811407016804",
    "lastIndexId": "0:0",
    "lastRelationId": "0:0",
    "lastSequenceId": "0:0",
    "modelVersion": 5
  }, check: false);

  final bindings = <Type, EntityDefinition>{};
  bindings[AppState] = EntityDefinition<AppState>(
      model: model.getEntityByUid(1462653170498243876),
      toOneRelations: (AppState object) => [],
      toManyRelations: (AppState object) => {},
      getId: (AppState object) => object.id,
      setId: (AppState object, int id) {
        object.id = id;
      },
      objectToFB: (AppState object, fb.Builder fbb) {
        fbb.startTable(3);
        fbb.addInt64(0, object.id);
        fbb.addBool(1, object.isLoading);
        fbb.finish(fbb.endTable());
        return object.id;
      },
      objectFromFB: (Store store, Uint8List fbData) {
        final buffer = fb.BufferContext.fromBytes(fbData);
        final rootOffset = buffer.derefObject(0);

        final object = AppState(
            isLoading:
                const fb.BoolReader().vTableGet(buffer, rootOffset, 6, false),
            id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0));

        return object;
      });
  bindings[NoteList] = EntityDefinition<NoteList>(
      model: model.getEntityByUid(4129672664802033205),
      toOneRelations: (NoteList object) => [],
      toManyRelations: (NoteList object) => {},
      getId: (NoteList object) => object.id,
      setId: (NoteList object, int id) {
        object.id = id;
      },
      objectToFB: (NoteList object, fb.Builder fbb) {
        fbb.startTable(2);
        fbb.addInt64(0, object.id);
        fbb.finish(fbb.endTable());
        return object.id;
      },
      objectFromFB: (Store store, Uint8List fbData) {
        final buffer = fb.BufferContext.fromBytes(fbData);
        final rootOffset = buffer.derefObject(0);

        final object = NoteList(
            id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0));

        return object;
      });
  bindings[Note] = EntityDefinition<Note>(
      model: model.getEntityByUid(8366181238560735452),
      toOneRelations: (Note object) => [],
      toManyRelations: (Note object) => {},
      getId: (Note object) => object.id,
      setId: (Note object, int id) {
        object.id = id;
      },
      objectToFB: (Note object, fb.Builder fbb) {
        final titleOffset = fbb.writeString(object.title);
        final imageUrlOffset = fbb.writeString(object.imageUrl);
        fbb.startTable(4);
        fbb.addInt64(0, object.id);
        fbb.addOffset(1, titleOffset);
        fbb.addOffset(2, imageUrlOffset);
        fbb.finish(fbb.endTable());
        return object.id;
      },
      objectFromFB: (Store store, Uint8List fbData) {
        final buffer = fb.BufferContext.fromBytes(fbData);
        final rootOffset = buffer.derefObject(0);

        final object = Note(
            title: const fb.StringReader().vTableGet(buffer, rootOffset, 6, ''),
            imageUrl:
                const fb.StringReader().vTableGet(buffer, rootOffset, 8, ''),
            id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0));

        return object;
      });
  bindings[Sentence] = EntityDefinition<Sentence>(
      model: model.getEntityByUid(7080524811407016804),
      toOneRelations: (Sentence object) => [],
      toManyRelations: (Sentence object) => {},
      getId: (Sentence object) => object.id,
      setId: (Sentence object, int id) {
        object.id = id;
      },
      objectToFB: (Sentence object, fb.Builder fbb) {
        final naturalSentenceOffset = fbb.writeString(object.naturalSentence);
        final structedSentenceOffset = fbb.writeString(object.structedSentence);
        final transrationOffset = fbb.writeString(object.transration);
        final grammerMemoOffset = fbb.writeString(object.grammerMemo);
        fbb.startTable(7);
        fbb.addInt64(0, object.id);
        fbb.addOffset(1, naturalSentenceOffset);
        fbb.addOffset(2, structedSentenceOffset);
        fbb.addOffset(3, transrationOffset);
        fbb.addOffset(4, grammerMemoOffset);
        fbb.addInt64(5, object.watchCount);
        fbb.finish(fbb.endTable());
        return object.id;
      },
      objectFromFB: (Store store, Uint8List fbData) {
        final buffer = fb.BufferContext.fromBytes(fbData);
        final rootOffset = buffer.derefObject(0);

        final object = Sentence(
            naturalSentence:
                const fb.StringReader().vTableGet(buffer, rootOffset, 6, ''),
            structedSentence:
                const fb.StringReader().vTableGet(buffer, rootOffset, 8, ''),
            transration:
                const fb.StringReader().vTableGet(buffer, rootOffset, 10, ''),
            grammerMemo:
                const fb.StringReader().vTableGet(buffer, rootOffset, 12, ''),
            watchCount:
                const fb.Int64Reader().vTableGet(buffer, rootOffset, 14, 0),
            id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0));

        return object;
      });

  return ModelDefinition(model, bindings);
}

class AppState_ {
  static final id =
      QueryIntegerProperty(entityId: 1, propertyId: 1, obxType: 6);
  static final isLoading =
      QueryBooleanProperty(entityId: 1, propertyId: 2, obxType: 1);
}

class NoteList_ {
  static final id =
      QueryIntegerProperty(entityId: 4, propertyId: 1, obxType: 6);
}

class Note_ {
  static final id =
      QueryIntegerProperty(entityId: 5, propertyId: 1, obxType: 6);
  static final title =
      QueryStringProperty(entityId: 5, propertyId: 2, obxType: 9);
  static final imageUrl =
      QueryStringProperty(entityId: 5, propertyId: 3, obxType: 9);
}

class Sentence_ {
  static final id =
      QueryIntegerProperty(entityId: 6, propertyId: 1, obxType: 6);
  static final naturalSentence =
      QueryStringProperty(entityId: 6, propertyId: 2, obxType: 9);
  static final structedSentence =
      QueryStringProperty(entityId: 6, propertyId: 3, obxType: 9);
  static final transration =
      QueryStringProperty(entityId: 6, propertyId: 4, obxType: 9);
  static final grammerMemo =
      QueryStringProperty(entityId: 6, propertyId: 5, obxType: 9);
  static final watchCount =
      QueryIntegerProperty(entityId: 6, propertyId: 6, obxType: 6);
}
