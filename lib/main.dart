import 'package:flutter/material.dart';
import 'package:itsmushi/app_states/google_sign_in.dart';
import 'package:itsmushi/app_states/user.dart';
import 'package:itsmushi/screens/home/home_screen.dart';
import 'package:itsmushi/screens/login/login_screen.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  static String app_name = "itsApp";
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: User(),
        ),
        ChangeNotifierProvider.value(
          value: GoogleSignInProvider(),
        ),
      ],
      child: MaterialApp(
        title: MyApp.app_name,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
        routes: {
          LoginScreen.routeName: (_) => LoginScreen(),
          HomeScreen.route_name: (_) => HomeScreen(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.app_name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () =>
                  {Navigator.of(context).pushNamed(LoginScreen.routeName)},
              child: Text("go to Login"),
            ),
          ],
        ),
      ),
    );
  }
}
