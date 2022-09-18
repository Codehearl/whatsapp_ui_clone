import 'package:flutter/material.dart';

void alertDialog(BuildContext context){

showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text("Alert!!"),
          content: const Text("Under Construction"),
          actions: [
            MaterialButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
        );

  }