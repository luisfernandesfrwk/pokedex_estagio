import 'package:flutter/material.dart';
import 'package:projeto_estagio/utils/colors_util.dart';

class Loading extends StatelessWidget {
  const Loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: ColorsUtil.primaryYellow,
      ),
    );
  }
}
