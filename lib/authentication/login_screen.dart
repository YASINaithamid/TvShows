import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tv_shows/mainScreen/shows_screen.dart';

class LoginWithGoogleScreen extends StatefulWidget {
  LoginWithGoogleScreen({Key? key}) : super(key: key);

  @override
  _LoginWithGoogleScreenState createState() => _LoginWithGoogleScreenState();
}

class _LoginWithGoogleScreenState extends State<LoginWithGoogleScreen> {
// creating firebase instance
  final FirebaseAuth auth = FirebaseAuth.instance;

// function to implement the google signin
  Future<void> signup(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;

      if (result != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ShowsScreen()));
      } // if result not null we go to Shows page,

    }
  }

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        if (connectivity == ConnectivityResult.none) {
          return OfflineMsg();
        } else {
          return child;
        }
      },
      builder: (BuildContext context) {
        return Container(
          width: double.infinity - 70,
          height: double.infinity - 400,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.red,
              ],
            ),
          ),
          child: Card(
            margin: EdgeInsets.only(top: 200, bottom: 200, left: 30, right: 30),
            elevation: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('images/logo.png'),
                Text(
                  " TV SHOWS APP  ",
                  style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 137, 160, 8),
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: MaterialButton(
                    color: Colors.teal[100],
                    elevation: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/Google.png'),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Sign In with Google")
                      ],
                    ),

                    // we call the function signup function
                    onPressed: () {
                      signup(context);
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class OfflineMsg extends StatelessWidget {
  const OfflineMsg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[600],
        title: Text("OFFLINE"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.all(10.00),
        margin: EdgeInsets.only(bottom: 10.00),
        color: Colors.red,
        child: Row(children: [
          Container(
            margin: EdgeInsets.only(right: 6.00),
            child: Icon(Icons.info, color: Colors.white),
          ), // icon for error message

          Text('Please check your network connectivity',
              style: TextStyle(color: Colors.white)),
          //show error message text
        ]),
      ),
    );
  }
}
