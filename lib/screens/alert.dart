import 'package:flutter/material.dart';
import 'package:new_nikkah_lab/screens/verify.dart';
import 'package:new_nikkah_lab/utilities/constants.dart';


class AlertMail extends StatefulWidget {
  const AlertMail({Key key}) : super(key: key);

  @override
  _AlertMailState createState() => _AlertMailState();
}

class _AlertMailState extends State<AlertMail> {
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

  Widget _getNotifiedButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerifyPhoto(),
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
          'I want to be notified',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _notNowButtom() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerifyPhoto(),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15.0),
        margin: EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xffb6b6b6),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Text(
          'Not now',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Container(
          child: Stack(children: [
            Positioned(
              child: _backButton(),
              top: 0,
              left: 0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                Image.asset('assets/Alerts.png'),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Keep Me Posted',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Find out when you get a message',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                Text(
                  'from clients',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                SizedBox(
                  height: 100,
                ),
                _getNotifiedButton(),
                SizedBox(
                  height: 20,
                ),
                _notNowButtom(),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
