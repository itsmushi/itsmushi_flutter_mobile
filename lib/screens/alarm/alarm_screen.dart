import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:itsmushi/main.dart';

class AlarmScreen extends StatelessWidget {
  static String route_name = "alarm_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.app_name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            icon: FaIcon(
              FontAwesomeIcons.clock,
              color: Colors.deepPurple,
            ),
            label: Text("Set Alarm"),
            onPressed: () {
              scheduleAlarm();
            },
          ),
        ],
      ),
    );
  }

  void scheduleAlarm() async {
    var scheduledNotificationDateTime =
        DateTime.now().add(Duration(seconds: 5));
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'alarm_notif',
      'alarm_notif',
      'Channel for Alarm notification',
      channelShowBadge: true,
      icon: 'app_icon',
      // sound: RawResourceAndroidNotificationSound('notification_sound.wav'),
      largeIcon: DrawableResourceAndroidBitmap('app_icon'),
    );

    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
        // sound: 'notification_sound.wav',
        presentAlert: true,
        presentBadge: true,
        presentSound: true);
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.schedule(
        0,
        'title',
        "This is the body",
        scheduledNotificationDateTime,
        platformChannelSpecifics);
  }
}
