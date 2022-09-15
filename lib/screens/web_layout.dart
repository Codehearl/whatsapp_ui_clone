import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/screens/contacts_list.dart';

class WebLayout extends StatelessWidget {
  const WebLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  //TODO appbar
                  //TODO searchbar
                  ContactList()
                ]),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/backgroundImage.png"),
                  fit: BoxFit.cover)),
          child: const Center(child: Text("Chats will show up here")),
          //TODO add chats screen 
        ),
      ],
    ));
  }
}
