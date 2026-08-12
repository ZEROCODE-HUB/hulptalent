import '/auth/supabase_auth/auth_util.dart';
import '/components/men_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'desactivar_cuenta_widget.dart' show DesactivarCuentaWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DesactivarCuentaModel extends FlutterFlowModel<DesactivarCuentaWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for men component.
  late MenModel menModel;

  // Bloquea el botón mientras corre el borrado.
  bool eliminando = false;

  @override
  void initState(BuildContext context) {
    menModel = createModel(context, () => MenModel());
  }

  @override
  void dispose() {
    menModel.dispose();
  }
}
