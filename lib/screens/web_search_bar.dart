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
        height: 50,
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
                  textAlign: TextAlign.center,
                  onChanged: null, //TODO Implement Search 
                  
                  decoration: InputDecoration(
                    filled: true,
                    hintStyle: const TextStyle(fontSize: 16,),
                    fillColor: searchBarColor,
                    hintText: "Search or start new chat",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: IconButton(
                          onPressed: () {
                            if (myFocusNode.hasFocus){
                                myFocusNode.unfocus();
                            }
                            else{
                              
                            }
                            
                            
                          },
                          icon: Icon(myFocusNode.hasFocus
                              ? Icons.arrow_back
                              : Icons.search_sharp)),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
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
