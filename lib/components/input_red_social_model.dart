import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'input_red_social_widget.dart' show InputRedSocialWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InputRedSocialModel extends FlutterFlowModel<InputRedSocialWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for inputProfileRedSocial widget.
  FocusNode? inputProfileRedSocialFocusNode;
  TextEditingController? inputProfileRedSocialTextController;
  String? Function(BuildContext, String?)?
      inputProfileRedSocialTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inputProfileRedSocialFocusNode?.dispose();
    inputProfileRedSocialTextController?.dispose();
  }
}
