import 'package:flutter/material.dart';
import 'package:whatsappfire/model/group.dart';
import 'dart:core';

class GroupTile extends StatelessWidget {
  const GroupTile({
    Key key,
    @required this.group,
  }) : super(key: key);

  final Group group;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 45,
        decoration: BoxDecoration(
          color: Colors.teal[100],
          shape: BoxShape.circle,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(group.name),
          Text(
            '${DateTime.now().hour.toString()}:${DateTime.now().minute.toString()}',
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 12,
            ),
          ),
        ],
      ),
      subtitle: Text(group.id),
    );
  }
}
