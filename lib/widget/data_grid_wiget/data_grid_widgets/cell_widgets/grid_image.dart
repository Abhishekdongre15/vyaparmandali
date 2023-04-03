



import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vyaparmandali/app_manager/constant/project_constant.dart';

class GridImage extends StatelessWidget {

  final String imagePath;

  const GridImage({super.key,
    required this.imagePath,
  });


  @override
  Widget build(BuildContext context) {
    String imageUrl=imagePath;
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) =>
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
              )
            ),
          ),
      placeholder: (context, url) => ProjectConstant.placeHolder,
      errorWidget: (context, url, error) => ProjectConstant.imageErrorIconWidget,
    );
  }
}
