import * as admin from 'firebase-admin';

admin.initializeApp()

admin.firestore().settings({ignoreUndefinedProperties: true})

import * as NoteList from './noteList/note_list'

export const noteList = {...NoteList}


