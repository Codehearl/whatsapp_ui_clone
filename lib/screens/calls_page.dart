import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/colors.dart';
import 'package:whatsapp_ui_clone/components/alert.dart';
import 'package:whatsapp_ui_clone/info.dart';


class CallsPage extends StatelessWidget {
  const CallsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                       const Icon(Icons.call_made,color:tabColor),
                        Text(
                          info[index]["time"].toString(),
                          style: const TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  trailing: const Icon(Icons.call,color:tabColor),
                  onTap: () => alertDialog(context), //TODO LEAD TO CHAT SCREEN
                ),
                
              ],
            );
          })),
    );
  }
}