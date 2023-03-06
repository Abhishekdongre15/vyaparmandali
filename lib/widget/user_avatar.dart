import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vyaparmandali/app_manager/constant/project_constant.dart';
import 'package:vyaparmandali/authentication/user_repository.dart';

class UserAvatar extends StatelessWidget {
  final double? radius;
  const UserAvatar({Key? key, this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<UserRepository, String?>(
        shouldRebuild: (prev, nex) => true,
        selector: (buildContext, vm) => vm.getUser.profileImg,
        builder: (context, String? data, child) {
          return CachedNetworkImage(
            imageUrl: data ?? "",
            imageBuilder: (context, imageProvider) =>
                CircleAvatar(
                  radius: radius,
                  backgroundImage: imageProvider,
                ),
            placeholder: (context, url) => ProjectConstant.placeHolder,
            errorWidget: (context, url, error) =>
            ProjectConstant.imageErrorIconWidget,
          );
        });
  }
}
