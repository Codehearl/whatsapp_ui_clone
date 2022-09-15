import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/colors.dart';
import 'package:whatsapp_ui_clone/screens/contacts_list.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Whatsapp",
              style: TextStyle(color: Colors.grey),
            ),
            backgroundColor: appBarColor,
            actions: const [
              IconButton(onPressed: null, icon: Icon(Icons.search)),
              IconButton(onPressed: null, icon: Icon(Icons.more_vert)),
            ],
            bottom: const TabBar(
                unselectedLabelColor: Colors.grey,
                labelColor: tabColor,
                indicatorColor: tabColor,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                tabs: [
                  Tab(
                    text: ("CHATS"),
                  ),
                  Tab(
                    text: ("STATUS"),
                  ),
                  Tab(
                    text: ("CALLS"),
                  ),
                ]),
                elevation: 0,
          ),
          body: const ContactList(),
        ));
  }
}
