import '/flutter_flow/flutter_flow_util.dart';
import 'assistance_widget.dart' show AssistanceWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AssistanceModel extends FlutterFlowModel<AssistanceWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;
  AudioPlayer? soundPlayer3;
  AudioPlayer? soundPlayer4;
  AudioPlayer? soundPlayer5;
  AudioPlayer? soundPlayer6;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
