import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/info.dart';
import 'package:whatsapp_ui_clone/components/alert.dart';
import 'package:whatsapp_ui_clone/colors.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: const [
              CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://pps.whatsapp.net/v/t61.24694-24/294576377_1270245143717279_859497102651956426_n.jpg?ccb=11-4&oh=01_AVwit0XZyGhCsyEjlyTLWyHLuCaQFQ_u4cclzS9cyl3Gog&oe=6330E8C8")),
              Icon(Icons.add_circle,color:tabColor)
            ],
          ),
          title: const Text('My Status'),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: info.length,
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading:  Container(
                        padding: const EdgeInsets.all(2),
                        decoration:const  BoxDecoration(
                          shape: BoxShape.circle,
                          color: tabColor

                        ),
                        child: CircleAvatar(
                          backgroundImage:
                              NetworkImage(info[index]["profilePic"].toString()),
                        ),
                      ),
                      title: Text(info[index]["name"].toString()),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          info[index]["time"].toString(),
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ),
                      
                      onTap: () =>
                          alertDialog(context), //TODO LEAD TO CHAT SCREEN
                    ),
                     
                  ],
                );
              })),
        ),
      ],
    );
  }
}
