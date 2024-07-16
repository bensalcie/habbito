import 'package:flutter/cupertino.dart';

class SubSectionItem {
  final String subsectiontitle;
  final IconData subsectionlocalimage;
  final Function() onClick;

  SubSectionItem({
    required this.subsectiontitle,
    required this.subsectionlocalimage,
    required this.onClick,
  });
}
