import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/colors.dart';

class WebSearchBar extends StatefulWidget {
  const WebSearchBar({super.key});

  @override
  State<WebSearchBar> createState() => _WebSearchBarState();
}

class _WebSearchBarState extends State<WebSearchBar> {
  late FocusNode myFocusNode;
  
  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }
  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height:MediaQuery.of(context).size.height * 0.05,
        padding:const  EdgeInsets.only(left:18,right :20, top:5),
        color: backgroundColor,
        child: Row(
          children: [
            Expanded(
              child: Focus(
                focusNode: myFocusNode,
                onFocusChange: (hasFocus) {
                  if (hasFocus) {
                    setState(() {});
                  } else {
                    setState(() {});
                  }
                },
                child: TextField(
                  
                  onChanged: null, //TODO Implement Search 
                  
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(fontSize: 14,) ,
                    contentPadding:const  EdgeInsets.only(left:20),
                    filled: true,
                    hintStyle: const TextStyle(fontSize: 14,),
                    fillColor: webAppBarColor,
                    hintText: "Search or start new chat",
                    prefixIcon: IconButton(
                        onPressed: () {
                          if (myFocusNode.hasFocus){
                              myFocusNode.unfocus();
                          }
                          else{
                            
                          }
                          
                          
                        },
                        icon: Icon(myFocusNode.hasFocus
                            ? Icons.arrow_back
                            : Icons.search_sharp, size: 14,)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                  ),
                ),
              ),
            ),
            IconButton(
                onPressed: (() {
                  //TODO implement FIlter
                }),
                icon:const Icon(Icons.more_horiz_sharp))
          ],
        ));
  }
}
