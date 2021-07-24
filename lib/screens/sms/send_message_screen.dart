import 'package:flutter/material.dart';
import 'package:itsmushi/main.dart';

import 'package:telephony/telephony.dart';

class SendMessage extends StatelessWidget {
  static String route_name   = "send_sms";


  void _sendSMSReal() async {
    final Telephony telephony = Telephony.instance;
    //get permission
    bool? permissionsGranted = await telephony.requestPhoneAndSmsPermissions;

    telephony.sendSms(
        to: "+255745303280",
        message: "testing itsmushi text!",
        statusListener: listener);
  }

  final SmsSendStatusListener listener = (SendStatus status) {
    print("status is:");
    print(status);
  };

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
                _sendSMSReal();
              },
              child: Text("send Sms directly"))
        ],
      ),
    );
  }
}
