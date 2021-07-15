import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:itsmushi/app_states/google_sign_in.dart';
import 'package:itsmushi/main.dart';
import 'package:itsmushi/screens/login/login_screen.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String route_name = "home_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(MyApp.app_name),
          actions: [
            ElevatedButton.icon(
              icon: FaIcon(FontAwesomeIcons.user),
              label: Text("Logout"),
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
                Navigator.of(context)
                    .pushReplacementNamed(LoginScreen.routeName);
              },
            ),
          ],
        ),
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              print("progressinggg");
              return Center(
                child: CircularProgressIndicator(
                  semanticsLabel: 'Linear progress indicator',
                  color: Colors.red,
                ),
              );
            } else if (snapshot.hasData) {
              final user = FirebaseAuth.instance.currentUser;
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(user!.photoURL!),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text("Name " + user.displayName!),
                    SizedBox(
                      height: 30,
                    ),
                    Text("Email " + user.email!),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Something went Wrong"),
              );
            } else {
              return Center(
                child: Text("Go to sign Up"),
              );
            }
          },
        ));
  }
}
