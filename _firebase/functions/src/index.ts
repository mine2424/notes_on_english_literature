import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

admin.initializeApp();

const db = admin.firestore();

export const createNoteList = functions.firestore.document('private/users/users_v1/{userId}/myNoteLists/{noteId}/').onCreate(
  (snap,context) => {
    const doc = snap.data()

    if (doc == null) {
      console.log('doc was null...');
      return;
    }

    return db.doc(`private/users/users_v1/{userId}/myNoteLists/{noteId}/readOnly/v1/`).set({
      'userId': doc.userId,
      'name': doc.name,
    },
    {merge: true}
    );
  }
)
