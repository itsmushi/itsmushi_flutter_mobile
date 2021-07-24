import 'package:flutter/material.dart';
import 'package:itsmushi/main.dart';

import 'package:flutter_sms/flutter_sms.dart';

class SendMessage extends StatelessWidget {
  static String route_name = "send_sms";

  void _sendSMS(String message, List<String> recipents) async {
    String _result = await sendSMS(message: message, recipients: recipents)
        .catchError((onError) {
      print(onError);
    });
    print(_result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          MyApp.app_name,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                String message = "This is a test message itsmushi!";
                List<String> recipents = ["+255745303280", "+255625528592"];

                _sendSMS(message, recipents);
              },
              child: Text("send Sms"))
        ],
      ),
    );
  }
}
