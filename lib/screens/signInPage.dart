import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_nikkah_lab/screens/dashboard.dart';
import 'package:new_nikkah_lab/screens/otp.dart';
import 'package:new_nikkah_lab/screens/welcome2.dart';
import 'package:new_nikkah_lab/utilities/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _auth = FirebaseAuth.instance;
  final _emailTEC = new TextEditingController();
  final _passTEC = new TextEditingController();
  bool _passwordVisible;
  bool _showSpinner = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        // back function
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: ShaderMask(
          shaderCallback: (bounds) => kLinearGradient.createShader(bounds),
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _enterPassField() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Enter password',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          TextFormField(
            controller: _passTEC,
            cursorColor: Colors.black,
            obscureText: !_passwordVisible,
            decoration: InputDecoration(
              hintText: 'Enter password',
              suffixIcon: IconButton(
                icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
              prefixIcon: Icon(
                Icons.lock_outline,
                color: Colors.black,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onSaved: (String value) {
              //
            },
            validator: (String value) {
              if (value.isEmpty) {
                return '*is required';
              } else {
                return null;
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _emailEntry() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          TextFormField(
            controller: _emailTEC,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: 'Enter email',
              prefixIcon: Icon(
                Icons.email_outlined,
                color: Colors.black,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onSaved: (String value) {
              //
            },
            validator: (String value) {
              if (value.isEmpty) {
                return '*is required';
              } else {
                return null;
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _signInButton() {
    return InkWell(
      onTap: () async {
        setState(() {
          _showSpinner = true;
        });
        try {
          final user = await _auth.signInWithEmailAndPassword(
              email: _emailTEC.text, password: _passTEC.text);
          if (user != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DashboardScreen()),
            );
          }
          setState(() {
            _showSpinner = false;
          });
        } catch (e) {
          print(e);
        }
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
          'Sign in',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _signUpAccount() {
    return InkWell(
      onTap: () {
        // log in screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WelcomeScreen2(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Sign up',
              style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: SafeArea(
          child: Container(
              height: height,
              padding: EdgeInsets.all(10),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: _backButton(),
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.05,
                        ),
                        Image.asset(
                          'assets/logo.png',
                          height: 120,
                        ),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        _emailEntry(),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        _enterPassField(),
                        Container(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              //resend button
                            },
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        _signInButton(),
                        SizedBox(
                          height: height * 0.11,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: _signUpAccount(),
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
