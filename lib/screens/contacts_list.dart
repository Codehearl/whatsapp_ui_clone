import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/info.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: ListView.builder(
          itemCount: info.length,
          shrinkWrap: true,
          itemBuilder: ((context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage(info[index]["profilePic"].toString()),
              ),
              title: Text(info[index]["name"].toString()),
              subtitle: Text(
                info[index]["message"].toString(),
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
              trailing: Text(info[index]["time"].toString(),style: const TextStyle(color: Colors.grey, fontSize: 12),),
              onTap: null, //TODO LEAD TO CHAT SCREEN
            );
          })),
    );
  }
}
