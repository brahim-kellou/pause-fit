import 'dart:math';
import 'package:flutter/material.dart';

class Avatar extends StatefulWidget {
  final String name;
  final Color color;
  final double score;
  Avatar(
      {Key? key, required this.name, required this.color, required this.score})
      : super(key: key);

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    var initials = widget.name.split(" ");
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.color,
          ),
          child: Center(
              child: Text(
            initials[0][0] + initials[1][0],
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).primaryColorDark.withOpacity(.8),
            ),
          )),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          initials[0] + " " + initials[1][0] + ".",
          style: TextStyle(
            color: Theme.of(context).primaryColorLight.withOpacity(.8),
            fontSize: 12,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          widget.score.toString() + " pts",
          style: TextStyle(
            color: Theme.of(context).primaryColorLight.withOpacity(.8),
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
