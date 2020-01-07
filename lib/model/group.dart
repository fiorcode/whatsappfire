import 'package:cloud_firestore/cloud_firestore.dart';

class Group {
  String id;
  String name;

  Group.fromFirestore(DocumentSnapshot documentSnapshot)
      : id = documentSnapshot.documentID,
        name = documentSnapshot.data['name'];
}

List<Group> toGroupList(QuerySnapshot query) =>
    query.documents.map((doc) => Group.fromFirestore(doc)).toList();
