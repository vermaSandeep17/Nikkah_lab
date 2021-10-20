import 'package:flutter/material.dart';
import 'package:new_nikkah_lab/screens/otp.dart';
import 'package:new_nikkah_lab/screens/signInPage.dart';
import 'package:new_nikkah_lab/utilities/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl/intl.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  var errorMessage;
  String firstName;
  String lastName;
  String address;
  String email;
  String phoneNumber;
  String password;
  String _dob;
  bool _passwordVisible;
  bool _showSpinner = false;

  final _firstTEC = new TextEditingController();
  final _lastTEC = new TextEditingController();
  final _addressTEC = new TextEditingController();
  final _passTEC = new TextEditingController();
  final _phoneTEC = new TextEditingController();
  final _dobTEC = new TextEditingController();
  final _emailTEC = new TextEditingController();

  DateTime _selectedDate;

  String verificationID;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _lastTEC.dispose();
    super.dispose();
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
            controller: _firstTEC,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: 'Enter first name',
              prefixIcon: Icon(
                Icons.person_outline,
                color: Colors.black,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onFieldSubmitted: (String value) {
              //
              firstName = value;
            },
            validator: (value) {
              if (value.isEmpty) {
                return '*is required';
              }
              return null;
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
            controller: _lastTEC,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: 'Enter last name',
              prefixIcon: Icon(
                Icons.person_outline,
                color: Colors.black,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onFieldSubmitted: (String value) {
              //
              lastName = value;
            },
            validator: (String value) {
              if (value.isEmpty) {
                return '*is required';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate ?? now,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (picked != null && picked != _selectedDate) {
      print('hello $picked');
      setState(() {
        _selectedDate = picked;
      });
    }
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
            controller: _dobTEC,
            onTap: () async {
              FocusScope.of(context).requestFocus(new FocusNode());
              // date picker
              await _selectDate(context);
              _dobTEC.text = DateFormat('yyyy/MM/dd').format(_selectedDate);
            },
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: 'Enter date of birth',
              prefixIcon: Icon(
                Icons.calendar_today_outlined,
                color: Colors.black,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onChanged: (String value) {
              //
              _dob = value;
            },
            validator: (String value) {
              if (value.isEmpty) {
                return 'Choose date ';
              }
              return null;
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
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onFieldSubmitted: (String value) {
              //
              address = value;
            },
            validator: (value) {
              if (value.isEmpty) {
                return '*is required';
              }
              return null;
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
              email = value;
            },
            validator: (value) {
              if (value.isEmpty || !value.contains('@')) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _newPhone() {
    return Container(
      child: Column(
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
          IntlPhoneField(
            validator: (value) {
              Pattern pattern = r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$';
              RegExp regex = new RegExp(pattern);
              if (!regex.hasMatch(value))
                return 'Please enter a number.';
              else
                return null;
            },
            autoValidate: true,
            decoration: InputDecoration(
              hintText: 'Enter phone number',
              prefixIcon: Icon(
                Icons.local_phone_outlined,
                color: Colors.black,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            initialCountryCode: 'US',
            onChanged: (phone) {
              phoneNumber = phone.completeNumber;
            },
          )
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
              counterText: '',
              hintText: 'Enter phone number',
              prefixIcon: Icon(
                Icons.local_phone_outlined,
                color: Colors.black,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onFieldSubmitted: (String value) {
              //
              phoneNumber = value;
            },
            validator: (value) {
              Pattern pattern = r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$';
              RegExp regex = new RegExp(pattern);
              if (!regex.hasMatch(value))
                return 'Please enter a number.';
              else
                return null;
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
              password = value;
            },
            validator: (value) {
              if (value.length < 8) {
                return 'Password must have atleast 8 characters';
              }
              return null;
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
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onSaved: (String value) {
              //
            },
            validator: (value) {
              if (_passTEC.text != value) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _continueButton() {
    return InkWell(
      onTap: () async {
        setState(() {
          _showSpinner = true;
        });
        var user = _auth.currentUser;

        try {
          if (_formKey.currentState.validate()) {
            final newUser = await _auth
                .createUserWithEmailAndPassword(
                    email: _emailTEC.text, password: _passTEC.text)
                .then((value) {
              FirebaseFirestore.instance
                  .collection('UserDetails')
                  .doc(user.uid)
                  .set({
                'First name': firstName,
                'Address': address,
                'Last name': lastName,
                'Phone number': phoneNumber,
              });
            }).then((value) async {
              await _auth.verifyPhoneNumber(
                  timeout: Duration(seconds: 120),
                  phoneNumber: phoneNumber,
                  verificationCompleted: (phoneAuthCredential) {},
                  verificationFailed: (verificationFailed) {
                    setState(() {
                      _showSpinner = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(verificationFailed.message),
                      ),
                    );
                  },
                  codeSent: (verificationId, resendingToken) {
                    setState(() {
                      verificationID = verificationId;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OtpConfirm(
                          phoneNumber: phoneNumber,
                          verificationID: verificationID,
                        ),
                      ),
                    );
                  },
                  codeAutoRetrievalTimeout: (value) {});
            });
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
      resizeToAvoidBottomInset: false,
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: SafeArea(
          child: Form(
            key: _formKey,
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
                        _newPhone(),
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
        ),
      ),
    );
  }
}


// DateTime date = DateTime(1900);
//               FocusScope.of(context).requestFocus(new FocusNode());

//               date = await showDatePicker(
//                   context: context,
//                   initialDate: DateTime.now(),
//                   firstDate: DateTime(1900),
//                   lastDate: DateTime(2100));

//               if (date != null && date != DateTime.now()) {
//                 setState(() {
//                   _selectedDate = date;
//                   var picked =
//                       "${date.toLocal().day}/${date.toLocal().month}/${date.toLocal().year}";
//                   _dobTEC.text = picked;
//                 });
//               }