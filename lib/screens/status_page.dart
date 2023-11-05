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
                     'https://images.unsplash.com/photo-1619194617062-5a61b9c6a049?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHJhbmRvbSUyMHBlb3BsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60' )),
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
