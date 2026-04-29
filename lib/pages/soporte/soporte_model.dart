import '/backend/schema/structs/index.dart';
import '/components/men_widget.dart';
import '/components/soporte_seleccion2_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/chat_i_a/chat_i_a_widget.dart';
import '/pages/proveedores/chat_user/chat_user_widget.dart';
import 'dart:ui';
import 'soporte_widget.dart' show SoporteWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SoporteModel extends FlutterFlowModel<SoporteWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for chatlist widget.
  ScrollController? chatlistScrollController;
  // Model for men component.
  late MenModel menModel;

  @override
  void initState(BuildContext context) {
    chatlistScrollController = ScrollController();
    menModel = createModel(context, () => MenModel());
  }

  @override
  void dispose() {
    chatlistScrollController?.dispose();
    menModel.dispose();
  }
}
