import 'package:flutter/material.dart';
import 'package:whatsappfire/pages/chat_page.dart';
import 'package:whatsappfire/pages/group_list_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Whatsapp',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => GroupListPage(),
        '/chat': (_) => ChatPage(),
      },
    );
  }
}

