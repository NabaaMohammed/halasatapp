import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(' sidebar'),

            Image ( image: AssetImage(
                  'assets/img/f5.jpg'),
              fit: BoxFit.cover,)

      ],
    );
  }
}
