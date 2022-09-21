import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/info.dart';
import 'package:whatsapp_ui_clone/components/alert.dart';
import 'package:whatsapp_ui_clone/colors.dart';
import 'dart:math';

class CustomShape extends CustomPainter {
  final Color bgColor;

  CustomShape(this.bgColor);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = bgColor;

    var path = Path();
    path.lineTo(-5, 0);
    path.lineTo(0, 10);
    path.lineTo(5, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class SenderMessage extends StatelessWidget {
  final String message;
  final String time;
  const SenderMessage({super.key, required this.message,required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(pi),
            child: CustomPaint(
              painter: CustomShape(senderMessageColor),
            ),
          ),
          Flexible(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(18),
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                ),
                color: senderMessageColor,
              ),
              padding: const EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                   Flexible(
                     child: Padding(
                      padding: const EdgeInsets.only(left:2.0,right: 10.0, bottom: 3.0),
                      child: Text(message,
                       maxLines: null,
                       overflow: TextOverflow.visible,
                       
                       
                          style: const TextStyle(
                              fontSize: 14,
                              color: textColor,
                              fontWeight: FontWeight.w400)),
                                     ),
                   ),
                  Align(
                      alignment: FractionalOffset.bottomRight,
                      child: Text(
                        time,
                        style: const TextStyle(fontSize: 9, color: Colors.grey),
                      )),
                  const Align(
                    alignment: FractionalOffset.bottomRight,
                    child: Icon(
                      Icons.done_all_sharp,
                      color: Colors.grey,
                      size: 11,
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

class MyMessage extends StatelessWidget {
  final String message;
  final String time;
  const MyMessage({super.key, required this.message, required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:1.0,horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                  color: messageColor),
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left:2.0,right: 10.0, bottom: 3.0),
                      child: Text(message,
                          style: const TextStyle(
                              fontSize: 14,
                              color: textColor,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                  Align(
                      alignment: FractionalOffset.bottomRight,
                      child: Text(
                        time,
                        style: const TextStyle(fontSize: 9, color: Colors.grey),
                      )),
                  const Align(
                    alignment: FractionalOffset.bottomRight,
                    child: Icon(
                      Icons.done_all_sharp,
                      color: Colors.grey,
                      size: 11,
                    ),
                  )
                ],
              ),
            ),
          ),
          CustomPaint(painter: CustomShape(messageColor))
        ],
      ),
    );
  }
}

class MessageCard extends StatelessWidget {
  final String message;
  final bool sender;
  final String time;
  const MessageCard(
      {super.key,
      required this.message,
      required this.sender,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: ((context) {
        if (sender) {
          return MyMessage(
            message: message,
            time: time,
          );
        } else {
          return SenderMessage(message: message,time: time,);
        }
      }),
    );
  }
}
