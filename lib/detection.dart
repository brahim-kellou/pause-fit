import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:huawei_ml_body/huawei_ml_body.dart';
import 'package:permission_handler/permission_handler.dart';

import 'utils.dart';

class Detection extends StatefulWidget {
  final Function setPaths;
  const Detection({Key? key, required this.setPaths}) : super(key: key);

  @override
  State<Detection> createState() => _DetectionState();
}

class _DetectionState extends State<Detection> {
  // Create a variable for lens texture.
  // This variable will bind native texture with app's texture.
  int? textureId;

  @override
  void initState() {
    super.initState();
    _initEngine();
  }

  void _initEngine() async {
    await Permission.camera.request();
    // Create a lens controller.
    final controller = MLBodyLensController(
        // Set the transaction type
        transaction: BodyTransaction.skeleton,
        // Set the lens to front or back
        lensType: MLBodyLensController.frontLens);

    // Create a lens engine object and specify the controller.
    final engine = MLBodyLensEngine(controller: controller);

    // To get real time transaction results, create a listener callback.
    void onTransaction({dynamic result}) {
      if (result != null) {
        var skeleton = List<MLSkeleton>.from(result as List);
        var paths = getPaths(skeleton.first);
        widget.setPaths(paths);
      }
    }

    // Then pass the callback to engine's setTransactor method.
    engine.setTransactor(onTransaction);

    // Initialize the texture for camera stream.
    await engine.init().then((value) {
      // Set the textureId variable to returned value.
      // Then the texture will be ready to stream
      setState(() => textureId = value);
    });

    // Call run method to start the stream
    engine.run();
  }

  @override
  Widget build(BuildContext context) {
    if (textureId != null)
      return MLBodyLens(
        textureId: textureId,
        width: MediaQuery.of(context).size.height,
        height: MediaQuery.of(context).size.height * 0.66,
      );
    return Text("Hello");
  }
}
