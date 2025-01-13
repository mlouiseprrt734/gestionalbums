import 'package:flutter/material.dart';

class AppBar_Principal extends StatefulWidget implements PreferredSizeWidget {
  AppBar_Principal(
      {super.key,
      required this.actions,
      required this.backgroundColor,
      required this.title});

  String title = "Gestion des albums";
  Color backgroundColor = const Color.fromARGB(255, 155, 114, 226);
  List<Widget> actions = [];

  @override
  State<AppBar_Principal> createState() => AppBar_PrincipalState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class AppBar_PrincipalState extends State<AppBar_Principal> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      backgroundColor: widget.backgroundColor,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        ...widget.actions
      ],
    );
  }
}
