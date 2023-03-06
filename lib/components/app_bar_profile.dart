import 'package:flutter/material.dart';
import 'package:uitoolkit/uitoolkit.dart';
import 'package:vyaparmandali/authentication/user_repository.dart';
import 'package:vyaparmandali/view/profile_page_view.dart';
import 'package:vyaparmandali/widget/user_avatar.dart';

class AppBarProfile extends StatelessWidget {
  const AppBarProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      title: const Text(
        "Vyapar Mandali",
      ),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications,
            color: ToolkitColors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.filter_center_focus,
            color: ToolkitColors.white,
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage(),));
          },
          child: const UserAvatar()
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.settings,
            color: ToolkitColors.white,
          ),
        ),
        IconButton(
          onPressed: () {
            UserRepository.of(context).logOutUser(context);
          },
          icon: const Icon(
            Icons.exit_to_app,
            color: ToolkitColors.white,
          ),
        ),
      ],
    );
  }
}