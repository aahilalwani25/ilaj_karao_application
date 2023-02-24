import 'package:flutter/material.dart';

alertMessage(BuildContext? context,String? title, Icon? icon) {
  showDialog(
      context: context!,
      builder: (builder) {
        return AlertDialog(
          icon: icon,
          content: Text("${title}"),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"))
          ],
        );
      });
}
