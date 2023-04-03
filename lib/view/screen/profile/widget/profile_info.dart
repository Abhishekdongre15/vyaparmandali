
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:readmore/readmore.dart';
import 'package:vyaparmandali/app_manager/helper/navigation/navigator.dart';
import 'package:vyaparmandali/app_manager/helper/navigation/route_name.dart';
import 'package:vyaparmandali/app_manager/theme/color_constant.dart';
import 'package:vyaparmandali/model/user.dart';
import 'package:vyaparmandali/widget/user_avatar.dart';

class ProfileInfoView extends StatelessWidget {
  final User user;
  const ProfileInfoView({Key? key, required this.user}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
      Expanded(child:   Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Expanded(child: Align(
              alignment: Alignment.bottomCenter,
              child: UserAvatar(
                radius: 70,
              ),
            )),
            SizedBox(
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(flex: 10),
                  TextButton(
                    child: const Text('Edit'),
                    onPressed: () {
                      context.push<User?>( RoutePath.registrationScreenView,
                      extra: user);
                    },
                  ),
                  const Spacer(flex: 1),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Padding(padding: const EdgeInsets.fromLTRB(100,20,100,20,),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text("${user.firstname??""} ${user.lastname??""}",
                    style: theme.textTheme.titleLarge?.copyWith(
                        fontSize: 30
                    )),
              ),),
            const SizedBox(height: 10),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Icon(Icons.phone, size: 20, color: Colors.grey[400]),
                const SizedBox(width: 5),
                Text(user.contactNo??"",
                    style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.grey
                    )),
              ],
            ),
            const SizedBox(height: 10),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Icon(Icons.email, size: 20, color: Colors.grey[400]),
                const SizedBox(width: 5),
                Text(user.email??"",
                    style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.grey
                    )),
              ],
            ),
            const SizedBox(height: 10),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Icon(Icons.location_pin, size: 20, color: Colors.grey[400]),
                const SizedBox(width: 5),
                Text("${user.city??""} ${user.state??""} ${user.country??""}",
                    style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.grey
                    )),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),),
        /// description
        Divider(height: 10, thickness: 1, color: Colors.grey[300]),
        Expanded(child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: ReadMoreText(
                user.description??"",
                trimLines: 2,
                colorClickableText: AppColor.primaryColor,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Show less',
                style: theme.textTheme.bodyLarge?.copyWith(
                    color: AppColor.grey
                ),
              ),
            ),),
        ))
      ],
    );
  }
}
