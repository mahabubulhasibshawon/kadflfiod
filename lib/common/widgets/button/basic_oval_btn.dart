import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BasicOvalBtn extends StatelessWidget {
  final String assetName;
  const BasicOvalBtn({super.key, required this.assetName});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: const Color(0xff30393C).withOpacity(0.5),
            shape: BoxShape.circle
          ),
          child: SvgPicture.asset(assetName, fit: BoxFit.none,),
        ),
      ),
    );
  }
}
