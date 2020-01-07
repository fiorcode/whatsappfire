import 'package:flutter/material.dart';
import 'package:whatsappfire/db.dart' as db;
import 'package:whatsappfire/model/group.dart';
import 'package:whatsappfire/widgets/group_tile.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({
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
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: TextStyle(backgroundColor: Colors.red),
              ),
            );
          }
          if (!snapshot.hasData) {
            return Align(
              alignment: Alignment.bottomCenter,
              child: LinearProgressIndicator(),
            );
          }
          List<Group> groups = snapshot.data;
          return ListView.separated(
            itemCount: groups.length,
            itemBuilder: (context, index) {
              final Group group = groups[index];
              return GroupTile(group: group);
            },
            separatorBuilder: (context, index) {
              return Divider(
                height: 1,
                indent: 75,
                endIndent: 25,
              );
            },
          );
        },
      ),
    );
  }
}
