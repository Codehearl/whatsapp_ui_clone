import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/colors.dart';


import 'package:whatsapp_ui_clone/info.dart';
import 'package:whatsapp_ui_clone/screens/chat_sceen.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: info.length,
        shrinkWrap: true,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        NetworkImage(info[index]["profilePic"].toString()),
                  ),
                  title: Text(info[index]["name"].toString()),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      info[index]["message"].toString(),
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                  trailing: Text(
                    info[index]["time"].toString(),
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  onTap: () {
                    Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(
                      
                        builder: ((context) => ChatScreen(
                            name: info[index]["name"].toString(),
                            uri: info[index]["profilePic"].toString()))));
                  }),
              const Divider(
                color: dividerColor,
              )
            ],
          );
        }));
  }
}
