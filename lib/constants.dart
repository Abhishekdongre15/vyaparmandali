import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reusekit/reusekit_controller.dart';
import 'package:vyaparmandali/views/components/drawer_list.dart';
import 'package:vyaparmandali/views/profile_page.dart';

// Colors used in this app
const primaryColor = Color.fromRGBO(17, 159, 250, 1);
const secondaryColor = Colors.white;
const bgColor = Color.fromRGBO(247, 251, 254, 1);
const textColor = Colors.black;
const lightTextColor = Colors.black26;
const transparent = Colors.transparent;

const grey = Color.fromRGBO(148, 170, 220, 1);
const purple = Color.fromRGBO(165, 80, 179, 1);
const orange = Color.fromRGBO(251, 137, 13, 1);
const green = Color.fromRGBO(51, 173, 127, 1);
const red = Colors.red;

// Default App Padding
const appPadding = 16.0;

TextStyle kLoginTitleStyle(Size size) => GoogleFonts.ubuntu(
      fontSize: size.height * 0.060,
      fontWeight: FontWeight.bold,
    );

TextStyle kLoginSubtitleStyle(Size size) => GoogleFonts.ubuntu(
      fontSize: size.height * 0.030,
    );

TextStyle kLoginTermsAndPrivacyStyle(Size size) =>
    GoogleFonts.ubuntu(fontSize: 15, color: Colors.grey, height: 1.5);

TextStyle kHaveAnAccountStyle(Size size) =>
    GoogleFonts.ubuntu(fontSize: size.height * 0.022, color: Colors.black);

TextStyle kLoginOrSignUpTextStyle(
  Size size,
) =>
    GoogleFonts.ubuntu(
      fontSize: size.height * 0.022,
      fontWeight: FontWeight.w500,
      color: ReUseKit.getColor.primaryColor,
    );

TextStyle kTextFormFieldStyle() => const TextStyle(color: Colors.black);

var defaultBackgroundColor = Colors.grey[300];
var appBarColor = ReUseKit.getColor.black;
var drawerTextColor = TextStyle(
  color: Colors.grey[600],
);
var tilePadding = const EdgeInsets.only(left: 8.0, right: 8, top: 8);
var myDrawer = Drawer(
  backgroundColor: ReUseKit.getColor.white,
  elevation: 0,
  child: ListView(
    children: [
      DrawerHeader(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Menu',style: TextStyle(fontSize: 30),),
          ],
        ),
      ),
      DrawerList(rName: 'Master',cName: 'Codes'),
      DrawerList(rName: 'Data Entry'),
      DrawerList(rName: 'Report'),
      DrawerList(rName: 'balance'),
      DrawerList(rName: 'utility'),
    ],
  ),
);
class AppBarProfile extends StatelessWidget {
  const AppBarProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      backgroundColor: ReUseKit.getColor.primaryColor,
      title: const Text('VyaparMandali'),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () {

          },
          icon: Icon(
            Icons.notifications,
            color: ReUseKit.getColor.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.filter_center_focus,
            color: ReUseKit.getColor.white,
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
            color: ReUseKit.getColor.white,
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
