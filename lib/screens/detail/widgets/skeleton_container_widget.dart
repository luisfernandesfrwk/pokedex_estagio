import 'package:flutter/material.dart';
import 'package:projeto_estagio/utils/colors_util.dart';
import 'package:skeleton_text/skeleton_text.dart';

class SkeletonContainer extends StatelessWidget {
  const SkeletonContainer._(
      {Key? key,
      this.width = double.infinity,
      this.color = Colors.grey,
      this.height = double.infinity})
      : super(key: key);

  const SkeletonContainer.title(
      {Key? key,
      required double width,
      required Color color,
      double height = 14})
      : this._(width: width, color: color, key: key, height: height);

  const SkeletonContainer.text({
    Key? key,
    required double width,
    required Color color,
    double height = 9,
  }) : this._(width: width, color: color, key: key, height: height);

  final double width;
  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) => SkeletonAnimation(
      curve: Curves.easeInQuad,
      shimmerColor: ColorsUtil.getColorByHex('FFFFFF').withOpacity(0.3),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: color,
        ),
      ));
}
