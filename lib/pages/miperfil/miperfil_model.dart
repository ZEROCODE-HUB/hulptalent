import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/men_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/proveedores/alert_cerrarsesion/alert_cerrarsesion_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'miperfil_widget.dart' show MiperfilWidget;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MiperfilModel extends FlutterFlowModel<MiperfilWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for men component.
  late MenModel menModel;

  @override
  void initState(BuildContext context) {
    menModel = createModel(context, () => MenModel());
  }

  @override
  void dispose() {
    menModel.dispose();
  }
}
