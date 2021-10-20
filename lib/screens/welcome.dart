import 'package:flutter/material.dart';
import 'package:new_nikkah_lab/screens/signInPage.dart';
import 'package:new_nikkah_lab/screens/welcome2.dart';
import 'package:new_nikkah_lab/utilities/constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _createAccountButton(String title) {
      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WelcomeScreen2(),
            ),
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 15.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: kLinearGradient,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    Widget _loginButton(String title) {
      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignIn(),
            ),
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 15.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xffb6b6b6),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png'),
            SizedBox(
              height: 120.0,
            ),
            Text(
              'Find the right one today',
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 120.0,
            ),
            _createAccountButton('Create account'),
            SizedBox(
              height: 20.0,
            ),
            _loginButton('Login'),
          ],
        ),
      ),
    );
  }
}
