import 'package:flutter/material.dart';
import 'package:whatsappfire/model/message.dart';

class MessageList extends StatelessWidget {
  const MessageList({
    Key key,
    @required this.messages,
  }) : super(key: key);

  final List<Message> messages;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(messages[index].text),
          subtitle: Text(messages[index].datetime.toString()),
        );
      },
    );
  }
}
