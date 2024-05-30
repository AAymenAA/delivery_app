import 'package:dilevery_app/core/constant/images.dart';
import 'package:flutter/material.dart';


class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      width: 120,
      height: 120,
      ImageAsset.alogo,
    );
  }
}
