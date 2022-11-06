import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hms_start_hacking_flutter/detection.dart';

import 'avatar.dart';
import 'skeleton_drawer.dart';
import 'dart:async';

var images = [
  "https://images.squarespace-cdn.com/content/v1/5b636f1c5cfd79ab80c2a1b8/1598921728116-UW1CHNNWSOV8HNZFEBP4/IMG_4437.JPG?format=1000w",
  "https://asset-a.grid.id/crop/0x0:0x0/x/photo/2021/11/04/tree-posejpg-20211104061538.jpg",
  "https://i-viaplay-com.akamaized.net/viaplay-prod/111/304/1467801584-c6c79deda846ed451e43f3e51e45fbfabda61196.jpg?width=1600&height=900",
  "https://images.squarespace-cdn.com/content/v1/5d31ed671abe780001b2964d/1569019403050-EUB4PKQDPESNT2CIBXJA/Phyllicia+in+dancer%27s+pose.",
  "https://assets.myy.org/dev/wp-content/uploads/20220601111320/AdobeStock_338364178-600x600.jpeg",
  "https://media.contentapi.ea.com/content/dam/star-wars-battlefront-2/images/2019/08/swbf2-refresh-hero-large-about-page-06-16x9-xl.jpg.adapt.crop1x1.320w.jpg",
  "https://imgix.bustle.com/uploads/image/2021/10/5/a55cc716-84d1-4a4e-8681-e34baf89c4c5-gettyimages-1266274241.jpg?w=800&fit=crop&crop=focalpoint&auto=format%2Ccompress&fp-x=0.3787&fp-y=0.702",
  "https://www.theyoganomads.com/wp-content/uploads/2022/02/pincha-mayurasana-hollow-back.jpg",
  "https://yogapose.com/wp-content/uploads/2020/08/dancer-pose-4-1-1.jpg",
  "https://cloudfront.timesnownews.com/media/chair_pose.PNG",
];

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with TickerProviderStateMixin {
  late AnimationController linearProgressController;
  List<List<Offset>> _paths = [];
  var index = 1;
  var rng = new Random();
  var imageUrl =
      "https://asset-a.grid.id/crop/0x0:0x0/x/photo/2021/11/04/tree-posejpg-20211104061538.jpg";

  Map<String, double> scores = {
    "player1": 0.00,
    "player2": 0.00,
    "player3": 0.00,
    "player4": 0.00,
  };

  void setPaths(List<List<Offset>> paths) {
    setState(() {
      _paths = paths;
    });
  }

  @override
  void initState() {
    linearProgressController = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(() {
        setState(() {});
      });
    Timer.periodic(Duration(seconds: 10), (timer) {
      index += 1;
      setState(() {
        this.scores = {
          "player1":
              (scores["player1"] ?? 0.00) + rng.nextInt(5).toDouble() + 5,
          "player2":
              (scores["player2"] ?? 0.00) + rng.nextInt(5).toDouble() + 5,
          "player3":
              (scores["player3"] ?? 0.00) + rng.nextInt(5).toDouble() + 5,
          "player4":
              (scores["player4"] ?? 0.00) + rng.nextInt(5).toDouble() + 5,
        };
        imageUrl = images[index % images.length];
      });
    });
    linearProgressController.repeat(reverse: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorDark.withOpacity(.8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Room #56789",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        )),
                    ElevatedButton(
                      onPressed: () {
                        debugPrint('ElevatedButton Clicked');
                      },
                      child: Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
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
                        image: DecorationImage(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                  Positioned(
                    child: LinearProgressIndicator(
                      value: linearProgressController.value,
                      semanticsLabel: 'Linear progress indicator',
                    ),
                    right: 0,
                    top: 0,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Column(
                      children: [
                        Text(
                          "Mehdi K.",
                          style: TextStyle(
                            color: Theme.of(context)
                                .primaryColorLight
                                .withOpacity(.8),
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          (scores["player2"] ?? 0.00).toString() + " pts",
                          style: TextStyle(
                              color: Theme.of(context)
                                  .primaryColorLight
                                  .withOpacity(.8),
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Avatar(
                      name: "Ibrahim Ahmedbacha",
                      color: Colors.orange,
                      score: scores["player2"] ?? 0.00),
                  Avatar(
                      name: "Brahim Kellou",
                      color: Colors.blue,
                      score: scores["player3"] ?? 0.00),
                  Avatar(
                      name: "Moumene Boumadane",
                      color: Colors.orangeAccent,
                      score: scores["player4"] ?? 0.00),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
