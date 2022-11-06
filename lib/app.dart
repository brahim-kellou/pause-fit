import 'package:flutter/material.dart';
import 'package:hms_start_hacking_flutter/detection.dart';

import 'avatar.dart';
import 'skeleton_drawer.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<List<Offset>> _paths = [];

  void setPaths(List<List<Offset>> paths) {
    setState(() {
      _paths = paths;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    print(MediaQuery.of(context).size.width);
    print(MediaQuery.of(context).size.height);
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark.withOpacity(.8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(
              children: [
                Detection(
                  setPaths: setPaths,
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.66,
                  child: CustomPaint(
                    size: Size(MediaQuery.of(context).size.width,
                        MediaQuery.of(context).size.height),
                    painter: SkeletonDrawer(_paths),
                    willChange: true,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    width: 120,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      // image: DecorationImage(
                      //   image: NetworkImage(
                      //       "https://asset-a.grid.id/crop/0x0:0x0/x/photo/2021/11/04/tree-posejpg-20211104061538.jpg"),
                      //   fit: BoxFit.cover,
                      // ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Avatar(),
                Avatar(),
                Avatar(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
