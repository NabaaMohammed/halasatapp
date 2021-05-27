import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  @override
  Widget build(BuildContext context) {
    return Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Icon(
            Icons.build_rounded,
            color: Colors.grey[100],
            size: 28,
          ),

        // Container(
        //   width: MediaQuery.of(context).size.width * 0.1,
        //   child: Icon(
        //     Icons.search,
        //     color: Colors.grey[100],
        //     size: 30,
        //   ),
        // ),
        Text(
            'هاله سات ',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.grey[100],
              fontSize: 22,
              fontWeight: FontWeight.bold,
                fontFamily: 'cairo'
            ),
          ),

      ],
    );
  }
}
