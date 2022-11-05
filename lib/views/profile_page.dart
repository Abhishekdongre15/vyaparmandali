import 'package:flutter/material.dart';
import 'package:vyaparmandali/responsive/responsive_layout.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdde9e9),
      appBar: AppBar(),
      body: SafeArea(
          child: Stack(
        children: [
          TopBackground(),
          SingleChildScrollView(
          scrollDirection: Axis.vertical,
            child:Column(
             children: [
               ProfilePanel(),
             ],
            ),
          ),
        ],
      )),
    );
  }
}

// Top Background
class TopBackground extends StatelessWidget {
  const TopBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      width: _width,
      height: MediaQuery.of(context).size.height*0.5,
      child: Image.asset("assets/images/mount.png",fit: BoxFit.cover,),
    );
  }
}
class ProfilePanel extends StatelessWidget {
  const ProfilePanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: ProfileImage()),
    );
  }
  Widget ProfileImage()=> CircleAvatar(
      radius: 70,backgroundImage: AssetImage('assets/images/person.png'),
  );
}
