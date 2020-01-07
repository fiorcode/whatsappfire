import 'package:cloud_firestore/cloud_firestore.dart';

import 'model/group.dart';
import 'model/message.dart';

Stream<List<Group>> getGroups() =>
    Firestore.instance.collection('groups').snapshots().map(toGroupList);

Stream<List<Message>> getGroupMessages(String groupId) => Firestore.instance
    .collection('groups/$groupId/messages')
    .snapshots()
    .map(toMessageList);
