import 'package:flutter/material.dart';

dynamic returnResponsiveChild(
    BuildContext context, dynamic mobileChild, dynamic tabChild) {
  var shortestSide = MediaQuery.of(context).size.shortestSide;
  if (shortestSide < 600) {
    return mobileChild;
  } else {
    return tabChild;
  }
}
