import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/colors.dart';
import 'package:whatsapp_ui_clone/components/alert.dart';
import 'package:whatsapp_ui_clone/components/popup_menu.dart';
import 'package:whatsapp_ui_clone/info.dart';

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
                onTap: () => alertDialog(context), //TODO LEAD TO CHAT SCREEN
              ),
              const Divider(
                color: dividerColor,
              )
            ],
          );
        }));
  }
}
