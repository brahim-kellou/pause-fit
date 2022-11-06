import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 140,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.orange,
          ),
          child: Center(
              child: Text(
            "BK",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).primaryColorDark.withOpacity(.8),
            ),
          )),
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          "55 pts",
          style: TextStyle(
              color: Theme.of(context).primaryColorLight.withOpacity(.8)),
        )
      ],
    );
  }
}
