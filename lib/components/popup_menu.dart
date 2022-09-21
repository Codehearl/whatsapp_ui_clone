import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/colors.dart';
import 'package:whatsapp_ui_clone/components/alert.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({super.key});

  

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.more_vert,color:iconColor),
      itemBuilder: (context) =>
      [
        const PopupMenuItem(
          value: 1,
          child: Text("New broadcast"),
        ),
        const PopupMenuItem(
          value: 1,
          child: Text("Linked devices"),
        ),
        const PopupMenuItem(
          value: 1,
          child: Text("starred messages"),
        ),
        const PopupMenuItem(
          value: 1,
          child: Text("settings"),
        )
      ],
      offset: const Offset(0,100),
      color: appBarColor,
      elevation: 2,

      onSelected: (value) => alertDialog(context),


      
    );
  }
}
