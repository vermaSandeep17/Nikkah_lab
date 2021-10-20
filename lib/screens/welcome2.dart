import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_nikkah_lab/screens/signup.dart';
import 'package:new_nikkah_lab/screens/signup2.dart';
import 'package:new_nikkah_lab/utilities/constants.dart';

class WelcomeScreen2 extends StatelessWidget {
  const WelcomeScreen2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isMale = false;
    Widget _alertDialogueBox() {
      return CupertinoAlertDialog(
        content: Container(
          alignment: Alignment.center,
          height: 120.0,
          width: double.infinity,
          child: Text(
            'Does your wali give you permisstion to use this service?',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
          ),
        ),
        actions: [
          CupertinoDialogAction(
            child: Text('NO'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            child: Text('YES'),
            onPressed: () {
              //yes functionality
              _isMale
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUp(),
                      ),
                    )
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpFemale(),
                      ),
                    );
            },
          ),
        ],
      );
    }

    Widget _femaleButton(String title) {
      return InkWell(
        onTap: () {
          _isMale = false;
          showDialog(
            context: context,
            builder: (BuildContext context) => _alertDialogueBox(),
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

    Widget _maleButton(String title) {
      return InkWell(
        onTap: () {
          _isMale = true;
          showDialog(
            context: context,
            builder: (BuildContext context) => _alertDialogueBox(),
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
              'Select your gender for',
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              'signup',
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 120.0,
            ),
            _maleButton('Male'),
            SizedBox(
              height: 20.0,
            ),
            _femaleButton('female'),
          ],
        ),
      ),
    );
  }
}
