import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:itsmushi/app_states/google_sign_in.dart';
import 'package:itsmushi/main.dart';
import 'package:itsmushi/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static String routeName = "login_screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

// Future signInWithGoogle() async {
//   final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//   final GoogleSignInAuthentication googleSignInAuthentication =
//   await googleSignInAccount.authentication;

//   final AuthCredential credential = GoogleAuthProvider.getCredential(
//     accessToken: googleSignInAuthentication.accessToken,
//     idToken: googleSignInAuthentication.idToken,
//   );

//   final AuthResult authResult = await _auth.signInWithCredential(credential);
//   final FirebaseUser user = authResult.user;

//   assert(!user.isAnonymous);
//   assert(await user.getIdToken() != null);

//   final FirebaseUser currentUser = await _auth.currentUser();
//   assert(user.uid == currentUser.uid);

//   return currentUser;
// }

// void signOutGoogle() async {
//   await FirebaseAuth.instance.signOut();
//   await googleSignIn.signOut();

//   print("User Sign Out");
// }

// Future getCurrentUser() async {
//   FirebaseUser _user = await FirebaseAuth.instance.currentUser();
//   return _user;
// }

// dynamic result = await getCurrentUser();

// if (result != null) {
//   FirebaseUser user = result;
//   globals.currentUser = user;
//   Navigator.pushReplacementNamed(context, '/mainPage');
// } else {
//   Navigator.pushReplacementNamed(context, '/login');
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.app_name),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //       image: AssetImage(
        //           "../../assets/background_images/login_background.jpeg"),
        //       fit: BoxFit.cover),
        // ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: <Widget>[
                  Text(
                    "Login screen",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
                  ),
                  ElevatedButton.icon(
                    icon: FaIcon(
                      FontAwesomeIcons.google,
                      color: Colors.red,
                    ),
                    label: Text("Sing in with Google"),
                    onPressed: () {
                      
                      final provider = Provider.of<GoogleSignInProvider>(
                          context,
                          listen: false);
                      provider.googleLogin();
                      Navigator.of(context).pushNamed(HomeScreen.route_name);
                    },
                  ),

                  SizedBox(height: 200.0),
                  // SignInButtonWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
