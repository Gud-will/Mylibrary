import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mylibrary/ui/uicolors.dart';

AppBar appbarwidget(GlobalKey<ScaffoldState> scaffoldKey, User user) {
  AppBar appbar=AppBar(
    leading: Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          scaffoldKey.currentState!.openDrawer();
        },
        child: CircleAvatar(
          backgroundImage: NetworkImage(user.photoURL ?? ""),
        ),
      ),
    ),
    title: Row(
      children: [
        Text(user.displayName ?? ""),
      ],
    ),
    elevation: 0,
  );
  appbarheight=appbar.preferredSize.height;
  return appbar;
}
