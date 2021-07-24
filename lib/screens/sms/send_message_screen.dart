import 'package:flutter/material.dart';
import 'package:itsmushi/main.dart';

import 'package:flutter_sms/flutter_sms.dart';

import 'package:telephony/telephony.dart';

class SendMessage extends StatelessWidget {
  static String route_name = "send_sms";

  void _requestSendSMS(String message, List<String> recipents) async {
    String _result = await sendSMS(message: message, recipients: recipents)
        .catchError((onError) {
      print(onError);
    });
    print(_result);
  }

  void _sendSMSReal() async {
    final Telephony telephony = Telephony.instance;
    //get permission
    bool? permissionsGranted = await telephony.requestPhoneAndSmsPermissions;

    telephony.sendSms(to: "+255745303280", message: "testing itsmushi text!");
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

                _requestSendSMS(message, recipents);
              },
              child: Text("direct to send Sms")),
          ElevatedButton(
              onPressed: () {
                _sendSMSReal();
              },
              child: Text("send Sms directly"))
        ],
      ),
    );
  }
}
