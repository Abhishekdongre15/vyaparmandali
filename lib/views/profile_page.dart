import 'package:flutter/material.dart';
import 'package:vyaparmandali/responsive/responsive_layout.dart';

import 'components/ProfileInfo.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Color(0xffdde9e9),
      appBar: AppBar(),
      body: SafeArea(
          child: Stack(
           alignment: Alignment.topCenter,
        children: [
          TopBackground(),
          ListView(
            children: [
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,),
                margin: EdgeInsets.only(top: 100,left: 50,right: 50,bottom: 100),
                height:  MediaQuery.of(context).size.height*1,
                width:  MediaQuery.of(context).size.width*0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child:CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage('https://media.istockphoto.com/photos/millennial-male-team-leader-organize-virtual-workshop-with-employees-picture-id1300972574?b=1&k=20&m=1300972574&s=170667a&w=0&h=2nBGC7tr0kWIU8zRQ3dMg-C5JLo9H2sNUuDjQ5mlYfo='),
                      ),
                    ),
                    ProfileInFo(),
                  ],
                ),
              ),
            ],
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
      height: MediaQuery.of(context).size.height * 0.5,
      child: Image.asset(
        "assets/images/mount.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
// //Profile Panel
// class ProfilePanel extends StatelessWidget {
//   const ProfilePanel({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       child: ProfileImage(),
//     );
//   }
//
//   Widget ProfileImage() => CircleAvatar(
//         radius: 70,
//         backgroundImage: AssetImage('assets/images/person.png'),
//       );
// }
