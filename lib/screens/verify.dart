import 'package:flutter/material.dart';
import 'package:new_nikkah_lab/screens/dashboard.dart';
import 'package:new_nikkah_lab/utilities/constants.dart';

class VerifyPhoto extends StatefulWidget {
  const VerifyPhoto({Key key}) : super(key: key);

  @override
  _VerifyPhotoState createState() => _VerifyPhotoState();
}

class _VerifyPhotoState extends State<VerifyPhoto> {
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

  Widget _addPhotoButton() {
    return InkWell(
      onTap: () {
        // photo add
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
          '+ Add Photo',
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
                'Please go through verification',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Take a photo with your document similar  ',
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'to the example below. The photo is only for',
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'verification purposes and won\'t be',
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'available publicly. We have to check that',
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                ' it’s really you.',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Image.asset('assets/verify.png'),
                color: Color(0xffFFF5F5),
              ),
              SizedBox(
                height: 120,
              ),
              _addPhotoButton()
            ],
          ),
        ),
      ),
    );
  }
}
