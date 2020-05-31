import 'package:flutter/material.dart';
//import 'package:flutter/'
import 'package:flutter/services.dart';

final double ToolBarHeight = 56.0;

double appBarHeight(BuildContext context){
  return screenAwareSize(ToolBarHeight,context);
}


double screenAwareSize(double size, BuildContext context){
  final double screenHeight = MediaQuery.of(context).size.height;
  double drawingHeight = MediaQuery.of(context).size.height -
                         MediaQuery.of(context).padding.top;
  print(size * drawingHeight / screenHeight);
  return size * drawingHeight / screenHeight;
}
