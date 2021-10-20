import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_nikkah_lab/screens/profile_info.dart';

final List<String> imgList = [
  'assets/roshan.jpg',
  'assets/Alerts.png',
  'assets/logo.png',
  'assets/otpConfirm.png',
  'assets/verify.png'
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int age = 22;
  String name = 'Charolatte';
  String city = 'New york, USA';

  Widget _iconRow() {
    return Container(
      height: 60,
      padding: EdgeInsets.all(0.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.center,
          colors: [Colors.black54, Colors.black87],
          stops: [0.2, 1],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              icon: FaIcon(
                FontAwesomeIcons.undo,
                color: Color(0xff3ED715),
              ),
              onPressed: () {
                // undo function
              }),
          IconButton(
              icon: Icon(
                Icons.close,
                color: Color(0xffF44336),
                size: 30,
              ),
              onPressed: () {
                // cancel function
              }),
          IconButton(
              icon: Icon(
                Icons.star,
                color: Colors.white,
              ),
              onPressed: () {
                // cancel function
              }),
          IconButton(
              icon: Icon(
                Icons.favorite,
                color: Color(0xffF44336),
              ),
              onPressed: () {
                // cancel function
              }),
          IconButton(
              icon: Icon(
                Icons.flash_on,
                color: Color(0xffF9FE00),
              ),
              onPressed: () {
                // cancel function
              })
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffFFF5F5),
        title: Text(
          'NikkahLab',
          style: TextStyle(fontSize: 22, color: Colors.redAccent),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: height,
        decoration: BoxDecoration(color: Color(0xffF4F4F4)),
        child: Column(
          children: [
            Container(
              height: height * 0.5,
              child: NewCarouselSlider(),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: height * 0.09,
              child: Stack(
                children: [
                  Text(
                    '$name , $age',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Positioned(
                    top: 30,
                    child: Row(
                      children: [
                        Icon(Icons.location_on),
                        Text(
                          '$city',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileInfo(),
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.info),
                    ),
                  ),
                ],
              ),
            ),
            _iconRow(),
          ],
        ),
      ),
    );
  }
}

class NewCarouselSlider extends StatefulWidget {
  const NewCarouselSlider({
    Key key,
  }) : super(key: key);

  @override
  _NewCarouselSliderState createState() => _NewCarouselSliderState();
}

class _NewCarouselSliderState extends State<NewCarouselSlider> {
  int _currentPos = 0;
  int _current = 0;
  final CarouselController _controller = CarouselController();

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            child: Container(
              color: Colors.grey,
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        item,
                        fit: BoxFit.fill,
                        width: 1000.0,
                      ),
                    ],
                  )),
            ),
          ))
      .toList();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 60.0,
                height: 4.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.redAccent)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4),
                ),
              ),
            );
          }).toList(),
        ),
        Expanded(
          child: CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
                height: 400,
                autoPlay: false,
                enlargeCenterPage: false,
                viewportFraction: 1.0,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
      ],
    );
  }
}

class Content {
  final String text;
  final Color color;

  Content({this.text, this.color});
}
