import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/colors.dart';

class WebStatusBar extends StatelessWidget {
  const WebStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return   AppBar(
      elevation: 0,
      backgroundColor: webAppBarColor,
      leading: const Padding(
        padding:  EdgeInsets.symmetric(horizontal: 13,vertical: 5),
        child:  CircleAvatar(
          radius: 5,
            backgroundImage: NetworkImage(
                "https://pps.whatsapp.net/v/t61.24694-24/294576377_1270245143717279_859497102651956426_n.jpg?ccb=11-4&oh=01_AVwit0XZyGhCsyEjlyTLWyHLuCaQFQ_u4cclzS9cyl3Gog&oe=6330E8C8")),
      ),
    actions: const [
        IconButton(onPressed: null,//TODO Implement pop up menu
         icon: Icon(Icons.message), //New chat Screen
         ),
        IconButton(onPressed: null, icon: Icon(Icons.more_vert)),
        
    
      ],

    
    
      
      
      
    );
  }
}
