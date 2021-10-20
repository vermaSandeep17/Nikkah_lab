import 'package:flutter/material.dart';
import 'package:new_nikkah_lab/utilities/constants.dart';

class TopPickScreen extends StatefulWidget {
  const TopPickScreen({Key key}) : super(key: key);

  @override
  _TopPickScreenState createState() => _TopPickScreenState();
}

class _TopPickScreenState extends State<TopPickScreen> {
  Widget _likesButton() {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.42,
        height: 37,
        padding: EdgeInsets.symmetric(vertical: 5.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Text(
          'Likes',
          style: TextStyle(color: Colors.black, fontSize: 13.0),
        ),
      ),
    );
  }

  Widget _topPicksButton() {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.42,
        height: 37.0,
        padding: EdgeInsets.symmetric(vertical: 5.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: kLinearGradient,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Text(
          'Top Picks',
          style: TextStyle(color: Colors.white, fontSize: 13.0),
        ),
      ),
    );
  }

  Widget _cardGridView() {
    return GridView.count(
      primary: false,
      padding: EdgeInsets.all(20),
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text("He'd have you all unravel at the"),
          color: Colors.green[100],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Heed not the rabble'),
          color: Colors.green[200],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Sound of screams but the'),
          color: Colors.green[300],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Who scream'),
          color: Colors.green[400],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Revolution is coming...'),
          color: Colors.green[500],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Revolution, they...'),
          color: Colors.green[600],
        ),
      ],
    );
  }

  Widget _unlockPicksButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width * 0.90,
        padding: EdgeInsets.symmetric(
          vertical: 15.0,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: kLinearGradient,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Text(
          'Unlock to picks',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _likesButton(),
              SizedBox(
                width: 20,
              ),
              _topPicksButton()
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Upgrade to NikkahLab Gold for',
            style: TextStyle(
                fontSize: 19.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'more top picks!',
            style: TextStyle(
                fontSize: 19.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: Stack(
            children: [
              _cardGridView(),
              Positioned(
                child: _unlockPicksButton(),
                top: MediaQuery.of(context).size.height * 0.6,
                left: MediaQuery.of(context).size.width * 0.05,
              )
            ],
          )),
        ],
      ),
    );
  }
}
