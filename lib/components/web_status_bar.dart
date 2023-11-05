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
        padding:  EdgeInsets.only(left: 18,top: 5),
        child:  CircleAvatar(
          radius: 5,
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1619194617062-5a61b9c6a049?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHJhbmRvbSUyMHBlb3BsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60')),
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
