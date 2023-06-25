import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mylibrary/api/apiget.dart';

final booksConverter =
    FirebaseFirestore.instance.collection("Books").withConverter<BookData>(
          fromFirestore: (snapshot, _) => BookData.fromJson(snapshot.data()!),
          toFirestore: (book, _) => book.toJson(),
        );

Future<void> addbookToUser(String uid, BookData books) async {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  await booksConverter.doc(books.id).get().then(
        (snapshot) => {
          if (snapshot.exists) {} else {booksConverter.doc(books.id).set(books)}
        },
      );
  return users.doc(uid).update(
    {
      'books': FieldValue.arrayUnion([books.id])
    },
  );
}

Future<BookData> getbook(String id) async {
  BookData book;
  Map<String, dynamic> doc;
  doc = await FirebaseFirestore.instance
      .collection("Books")
      .doc(id)
      .get()
      .then((snapshot) {
    return snapshot.data()!;
  });
  book = BookData.fromJsonfirebase(doc);
  return book;
}

// Future<List<BookData>> getuserbooks(String uid) async {
//   DocumentSnapshot<Map<String, dynamic>> doc =
//       await FirebaseFirestore.instance.collection('Users').doc(uid).get();
//   final booksid = doc.data()!['books'];
//   debugPrint(booksid.toString());
//   List<BookData> booksList = [];
//   for (var i = 0; i < booksid.length; i++) {
//     booksList.add(await getbook(booksid[i]));
//     debugPrint(booksList.toString());
//   }
//   debugPrint(booksList[0].toString());
//   return booksList;
// }
