import 'package:flutter/material.dart';
import 'package:whatsappfire/db.dart' as db;
import 'package:whatsappfire/model/group.dart';
import 'package:whatsappfire/widgets/groups_list.dart';
import 'package:whatsappfire/widgets/loading.dart';
import 'package:whatsappfire/widgets/red_error.dart';

class GroupListPage extends StatelessWidget {
  const GroupListPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Whatsapp'),
      ),
      body: StreamBuilder(
        stream: db.getGroups(),
        builder: (context, AsyncSnapshot<List<Group>> snapshot) {
          if (snapshot.hasError) return RedError(snapshot.error);
          if (!snapshot.hasData) return Loading();
          return GroupList(groups: snapshot.data);
        },
      ),
    );
  }
}
