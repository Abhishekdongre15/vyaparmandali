import 'package:flutter/material.dart';
import 'package:uitoolkit/uitoolkit.dart';

import '../views/profile_page_view.dart';
class AppBarProfile extends StatelessWidget {
  const AppBarProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      backgroundColor: ToolkitColors.primary,
      title: Text(
        "Vyapar Mandali",
        style: ToolkitTypography.body2A.copyWith(
          color: ToolkitColors.black,
        ),
      ),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications,
            color: ToolkitColors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.filter_center_focus,
            color: ToolkitColors.white,
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(),));
          },
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://media.istockphoto.com/photos/millennial-male-team-leader-organize-virtual-workshop-with-employees-picture-id1300972574?b=1&k=20&m=1300972574&s=170667a&w=0&h=2nBGC7tr0kWIU8zRQ3dMg-C5JLo9H2sNUuDjQ5mlYfo='),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.settings,
            color: ToolkitColors.white,
          ),
        ),
      ],
    );
  }
}