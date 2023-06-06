import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:valoinfos/constants/enums.dart';
import 'package:valoinfos/constants/extension.dart';
import 'package:valoinfos/constants/style.dart';
import 'package:valoinfos/widgets/packages/shimmer/shimmer_loading.dart';

class CacheImage extends StatelessWidget {
  const CacheImage({
    super.key,
    required this.image,
    this.height,
    this.color,
    required this.fit,
  });
  final String? image;
  final double? height;
  final Color? color;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    if (image != null) {
      return ShimmerLoading(
        isLoading: image == null,
        child: CachedNetworkImage(
          imageUrl: image!,
          errorWidget: (context, url, error) => SvgPicture.asset(IconPath.info.name.iconPath),
          fit: fit,
          height: height,
          color: color,
          progressIndicatorBuilder: (context, url, progress) {
            return Center(
              child: CircularProgressIndicator(
                value: progress.progress,
                color: Style.transparentColor,
              ),
            );
          },
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
