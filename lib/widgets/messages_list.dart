import 'package:flutter/material.dart';
import 'package:whatsappfire/model/message.dart';
import 'package:whatsappfire/widgets/message_widget.dart';

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
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 2, 16, 5),
          child: MessageWidget(messages[index]),
        );
      },
    );
  }
}


