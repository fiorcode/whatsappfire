import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String id, text, userId;
  DateTime datetime;

  Message(this.text) : datetime = DateTime.now();

  Map<String, dynamic> toFirestore() => {
    'text': text,
    'datetime': datetime,
  };

  Message.fromFirestore(DocumentSnapshot documentSnapshot)
      : id = documentSnapshot.documentID,
        text = documentSnapshot.data['text'],
        datetime = (documentSnapshot.data['datetime'] as Timestamp).toDate();
}

List<Message> toMessageList(QuerySnapshot query) =>
    query.documents.map((doc) => Message.fromFirestore(doc)).toList();
