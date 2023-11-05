import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/colors.dart';
import 'package:whatsapp_ui_clone/components/alert.dart';
import 'package:whatsapp_ui_clone/components/messages.dart';
import 'package:whatsapp_ui_clone/info.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  final String uri;
  const ChatScreen({super.key, required this.name, required this.uri});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  bool _isEdited = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: appBarColor,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          title: Row(
            children: [
              IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: iconColor,
                  )),
              CircleAvatar(
                radius: 14,
                backgroundImage: NetworkImage(
                  widget.uri,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(widget.name,
                          style: const TextStyle(
                            fontSize: 15,
                            overflow: TextOverflow.ellipsis,
                          )),
                      const Text(
                        "Online",
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w200),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () => alertDialog(context),
                icon: const Icon(Icons.video_call, color: iconColor)),
            IconButton(
              onPressed: () => alertDialog(context),
              icon: const Icon(Icons.call, color: iconColor),
            ),
            IconButton(
              onPressed: () => alertDialog(context),
              icon: const Icon(Icons.more_vert, color: iconColor),
            )
          ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return MessageCard(
                    message: messages[index]["text"].toString(),
                    sender: messages[index]["isMe"] == true,
                    time: messages[index]["time"].toString(),
                  );
                }),
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.07,
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.1,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      onChanged: (value) {
                        if (_textEditingController.text.isNotEmpty) {
                          setState(() {
                            _isEdited = true;
                          });
                        }
                      },
                      expands: true,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintText: "Message",
                        hintStyle:
                            const TextStyle(color: iconColor, fontSize: 20),
                        suffixIcon: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.27,
                          child: Row(children: [
                            IconButton(
                                alignment: Alignment.bottomCenter,
                                onPressed: (() => alertDialog(context)),
                                icon: const Icon(
                                  Icons.attach_file,
                                  color: iconColor,
                                  size: 20,
                                )),
                            IconButton(
                                alignment: Alignment.bottomCenter,
                                onPressed: (() => alertDialog(context)),
                                icon: const Icon(Icons.camera_alt_rounded,
                                    color: iconColor, size: 20)),
                          ]),
                        ),
                        prefixIcon: IconButton(
                            alignment: Alignment.bottomCenter,
                            onPressed: (() => alertDialog(context)),
                            icon: const Icon(Icons.emoji_emotions,
                                color: iconColor, size: 20)),
                        filled: true,
                        fillColor: appBarColor,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: tabColor),
                      child: IconButton(
                          onPressed: (() {
                            if (_isEdited) {
                              setState(() {
                                messages.add({
                                  "isMe": true,
                                  "text": _textEditingController.text,
                                  "time":
                                      "${DateTime.now().hour.toString()} ${DateTime.now().minute.toString()}"
                                });
                                _textEditingController.clear();
                              });
                            }
                          }),
                          icon: Icon(
                            _isEdited ? Icons.send : Icons.mic,
                            color: Colors.white,
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
