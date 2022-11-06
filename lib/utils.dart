import 'dart:ui';

import 'package:huawei_ml_body/huawei_ml_body.dart';

List<List<Offset>> getPaths(MLSkeleton skeleton) {
  List<List<Offset>> paths = [];

  paths.add(getPath(getJointPoint(skeleton, MLJoint.typeHeadTop),
      getJointPoint(skeleton, MLJoint.typeNeck)));

  paths.add(getPath(getJointPoint(skeleton, MLJoint.typeNeck),
      getJointPoint(skeleton, MLJoint.typeLeftShoulder)));

  paths.add(getPath(getJointPoint(skeleton, MLJoint.typeLeftShoulder),
      getJointPoint(skeleton, MLJoint.typeLeftElbow)));

  paths.add(getPath(getJointPoint(skeleton, MLJoint.typeLeftElbow),
      getJointPoint(skeleton, MLJoint.typeLeftWrist)));

  paths.add(getPath(getJointPoint(skeleton, MLJoint.typeNeck),
      getJointPoint(skeleton, MLJoint.typeLeftHip)));

  paths.add(getPath(getJointPoint(skeleton, MLJoint.typeLeftHip),
      getJointPoint(skeleton, MLJoint.typeLeftKnee)));

  paths.add(getPath(getJointPoint(skeleton, MLJoint.typeLeftKnee),
      getJointPoint(skeleton, MLJoint.typeLeftAnkle)));

  paths.add(getPath(getJointPoint(skeleton, MLJoint.typeNeck),
      getJointPoint(skeleton, MLJoint.typeRightShoulder)));

  paths.add(getPath(getJointPoint(skeleton, MLJoint.typeRightShoulder),
      getJointPoint(skeleton, MLJoint.typeRightElbow)));

  paths.add(getPath(getJointPoint(skeleton, MLJoint.typeRightElbow),
      getJointPoint(skeleton, MLJoint.typeRightWrist)));

  paths.add(getPath(getJointPoint(skeleton, MLJoint.typeNeck),
      getJointPoint(skeleton, MLJoint.typeRightHip)));

  paths.add(getPath(getJointPoint(skeleton, MLJoint.typeRightHip),
      getJointPoint(skeleton, MLJoint.typeRightKnee)));

  paths.add(getPath(getJointPoint(skeleton, MLJoint.typeRightKnee),
      getJointPoint(skeleton, MLJoint.typeRightAnkle)));

  return paths;
}

List<Offset> getPath(MLJoint? joint1, MLJoint? joint2) {
  Offset startPoint =
      Offset(360.0 - joint1?.pointX * 360 / 1080, joint1?.pointY * 770 / 2110);
  Offset endPoint =
      Offset(360.0 - joint2?.pointX * 360 / 1080, joint2?.pointY * 770 / 2110);

  return [startPoint, endPoint];
}

MLJoint? getJointPoint(MLSkeleton skeleton, int type) {
  return skeleton.joints.firstWhere((join) => join?.type == type);
}
