import 'package:cloud_firestore/cloud_firestore.dart';

import 'model/group.dart';

Stream<List<Group>> getGroups() =>
    Firestore.instance.collection('groups').snapshots().map(toGroupList);
