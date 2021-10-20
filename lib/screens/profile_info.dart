import 'package:flutter/material.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({Key key}) : super(key: key);

  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  String username = 'Charlotte';
  int age = 22;
  String cityName = 'New Yourk, USA';
  Widget _shareProfileButton() {
    return InkWell(
      child: Container(
        // alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            Icon(
              Icons.share,
              color: Colors.redAccent,
              size: 17,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Share $username Profile',
              style: TextStyle(
                  fontSize: 18.67,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFF5F5),
        leading: Container(
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          child: Icon(Icons.person),
        ),
        title: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    '$username ,',
                    style: TextStyle(
                        fontSize: 18.67,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$age',
                    style: TextStyle(fontSize: 13.58, color: Colors.black),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.black54,
                    size: 16,
                  ),
                  Text(
                    '$cityName',
                    style: TextStyle(fontSize: 13.58, color: Colors.black54),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 17.0, color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus nunc tellus nec amet semper. Nisi morbi suspendisse amet, gravida ornare interdum feugiat nullam felis. Nunc eget volutpat'),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.black,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Passion',
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Divider(
              color: Colors.black,
              height: 1.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'My anthem',
              style: TextStyle(
                fontSize: 17.0,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 60),
                alignment: Alignment.bottomRight,
                child: _shareProfileButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
