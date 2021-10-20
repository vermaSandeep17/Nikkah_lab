import 'package:flutter/material.dart';
import 'package:new_nikkah_lab/screens/otp.dart';
import 'package:new_nikkah_lab/screens/signInPage.dart';
import 'package:new_nikkah_lab/utilities/constants.dart';

class SignUpFemale extends StatefulWidget {
  const SignUpFemale({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpFemale> {
  TextEditingController _controller;
  bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
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

  Widget _firstNameEntry() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'First Name',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          TextFormField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: 'Enter first name',
              prefixIcon: Icon(
                Icons.person_outline,
                color: Colors.black,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
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

  Widget _lastNameEntry() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Last Name',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          TextFormField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: 'Enter last name',
              prefixIcon: Icon(
                Icons.person_outline,
                color: Colors.black,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
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

  Widget _dobEntry() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Date of birth',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          TextFormField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: 'Enter date of birth',
              prefixIcon: Icon(
                Icons.calendar_today_outlined,
                color: Colors.black,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
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

  Widget _addressEntry() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Address',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          TextFormField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: 'Enter address',
              prefixIcon: Icon(
                Icons.location_on_outlined,
                color: Colors.black,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
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
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: 'Enter email',
              prefixIcon: Icon(
                Icons.email_outlined,
                color: Colors.black,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
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

  Widget _phoneNumberEntry() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Phone number',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          TextFormField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: 'Enter phone number',
              prefixIcon: Icon(
                Icons.local_phone_outlined,
                color: Colors.black,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
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

  Widget _relationEntry() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Relation to you',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          TextFormField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: 'Enter relation',
              prefixIcon: Icon(
                Icons.person_outline,
                color: Colors.black,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
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

  Widget _createPassEntry() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Create password',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          TextFormField(
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
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
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

  Widget _confirmPassEntry() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Confirm password',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          TextFormField(
            cursorColor: Colors.black,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Enter password',
              prefixIcon: Icon(
                Icons.lock_outline,
                color: Colors.black,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
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

  Widget _continueButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpConfirm(),
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
          'Continue',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _loginAccount() {
    return InkWell(
      onTap: () {
        // log in screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SignIn(),
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
              'Already have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Sign in',
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
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Container(
          // padding: EdgeInsets.all(8.0),
          height: height,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: _backButton(),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView(
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      height: 110,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    _firstNameEntry(),
                    SizedBox(
                      height: 20,
                    ),
                    _lastNameEntry(),
                    SizedBox(
                      height: 20,
                    ),
                    _dobEntry(),
                    SizedBox(
                      height: 20,
                    ),
                    _addressEntry(),
                    SizedBox(
                      height: 20,
                    ),
                    _emailEntry(),
                    SizedBox(
                      height: 20,
                    ),
                    _phoneNumberEntry(),
                    SizedBox(
                      height: 20,
                    ),
                    _relationEntry(),
                    SizedBox(
                      height: 20,
                    ),
                    _createPassEntry(),
                    SizedBox(
                      height: 20,
                    ),
                    _confirmPassEntry(),
                    SizedBox(
                      height: 50,
                    ),
                    _continueButton(),
                    SizedBox(
                      height: 10,
                    ),
                    _loginAccount(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
