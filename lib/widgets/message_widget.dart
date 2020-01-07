import 'package:flutter/material.dart';
import 'package:whatsappfire/model/message.dart';

class MessageWidget extends StatelessWidget {
  final Message msg;
  const MessageWidget(this.msg);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Material(
          elevation: 1,
          borderRadius: BorderRadius.all(Radius.circular(3)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                child: Text(
                  msg.text,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2, right: 2),
                child: Text(msg.hhmm, style: TextStyle(fontSize: 10, color: Colors.grey),),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
