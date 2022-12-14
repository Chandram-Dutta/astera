import 'package:flutter/material.dart';

bool isDesktop(BuildContext context, int breakpoint) {
  return MediaQuery.of(context).size.width >= breakpoint;
}
