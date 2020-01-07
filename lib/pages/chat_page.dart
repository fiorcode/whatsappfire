import 'package:flutter/material.dart';
import 'package:whatsappfire/db.dart' as db;
import 'package:whatsappfire/model/group.dart';
import 'package:whatsappfire/model/message.dart';
import 'package:whatsappfire/widgets/loading.dart';
import 'package:whatsappfire/widgets/messages_list.dart';
import 'package:whatsappfire/widgets/messege_box.dart';
import 'package:whatsappfire/widgets/red_error.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Group group = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text(group.name)),
      backgroundColor: Colors.teal[100],
      body: StreamBuilder(
        stream: db.getGroupMessages(group.id),
        builder: (context, AsyncSnapshot<List<Message>> snapshot) {
          if (snapshot.hasError) return RedError(snapshot.error);
          if (!snapshot.hasData) return Loading();
          return Column(
            children: <Widget>[
              Expanded(child: MessageList(messages: snapshot.data)),
              MessageBox(onSend: (text) {
                db.sendMessage(group.id, Message(text));
              }),
            ],
          );
        },
      ),
    );
  }
}
