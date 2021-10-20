import 'package:flutter/material.dart';
import 'package:new_nikkah_lab/screens/dashboard.dart';
import 'package:new_nikkah_lab/utilities/constants.dart';

class VerifyProgress extends StatefulWidget {
  const VerifyProgress({Key key}) : super(key: key);

  @override
  _VerifyProgressState createState() => _VerifyProgressState();
}

class _VerifyProgressState extends State<VerifyProgress> {
  Widget _backButton() {
    return InkWell(
      onTap: () {
        // back function
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

  Widget _okayButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DashboardScreen(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: kLinearGradient,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Text(
          'Okay',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _backButton(),
        title: Text(
          'Verification',
          style: TextStyle(fontSize: 22, color: Colors.redAccent),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffFFF5F5),
        // toolbarHeight: 70,
      ),
      body: SafeArea(
        top: false,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'Verification is in progress',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'We need some time to check your photo.',
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                ' We will contact you shortly.',
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 80,
              ),
              Container(
                height: 279.88,
                width: 284.61,
                color: Color(0xffFFF5F5),
              ),
              SizedBox(
                height: 80,
              ),
              _okayButton()
            ],
          ),
        ),
      ),
    );
  }
}
