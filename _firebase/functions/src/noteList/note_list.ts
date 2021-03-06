import * as functions from 'firebase-functions'
import * as admin from 'firebase-admin'

const db = admin.firestore()

export const createNoteList = functions.firestore
  .document('private/users/users_v1/{userId}/myNoteLists/writeOnly/v1/{noteId}')
  .onCreate(async (snap, context) => {
    const doc = snap.data()

    if (doc == null) {
      console.log('doc was null...')
      return
    }

    await db.doc(`private/users/users_v1/${doc.uid}/myNoteLists/readOnly/v1/${doc.noteId}`).set(
      {
        uid: doc.uid,
        title: doc.title,
        parentNoteId: doc.parentNoteId,
        isOrigin: doc.isOrigin,
        noteId: doc.noteId,
        imageUrl: doc.imageUrl,
        sentenceList: doc.sentenceList,
        createdAt: doc.createdAt,
        author: doc.author,
      },
      { merge: true },
    )
  })

export const updateNoteList = functions.firestore
  .document('private/users/users_v1/{userId}/myNoteLists/writeOnly/v1/{noteId}')
  .onUpdate(async (snap, context) => {
    const doc = snap.after.data()

    if (doc == null) {
      console.log('doc was null...')
      return
    }

    await db.doc(`private/users/users_v1/${doc.uid}/myNoteLists/readOnly/v1/${doc.noteId}`).set(
      {
        uid: doc.uid,
        title: doc.title,
        parentNoteId: doc.parentNoteId,
        isOrigin: doc.isOrigin,
        noteId: doc.noteId,
        imageUrl: doc.imageUrl,
        sentenceList: doc.sentenceList,
        createdAt: doc.createdAt,
        author: doc.author,
      },
      { merge: true },
    )
  })

export const deleteNoteList = functions.firestore
  .document('private/users/users_v1/{userId}/myNoteLists/writeOnly/v1/{noteId}')
  .onDelete(async (snap, context) => {
    const doc = snap.data()

    if (doc == null) {
      console.log('doc was null...')
      return
    }

    await db.doc(`private/users/users_v1/${doc.uid}/myNoteLists/readOnly/v1/${doc.noteId}`).delete()
  })
