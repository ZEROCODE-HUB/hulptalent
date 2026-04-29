import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/aceptar_servicio_widget.dart';
import '/components/men_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'solicitudes_copy_widget.dart' show SolicitudesCopyWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SolicitudesCopyModel extends FlutterFlowModel<SolicitudesCopyWidget> {
  ///  State fields for stateful widgets in this page.

  Stream<List<SolicitudesServicioRow>>? containerSupabaseStream1;
  Stream<List<UsuariosRow>>? containerSupabaseStream2;
  // State field(s) for Switch widget.
  bool? switchValue;
  Stream<List<SolicitudesServicioRow>>? containerSupabaseStream3;
  // State field(s) for aceptadas widget.
  late ExpandableController aceptadasExpandableController;

  // State field(s) for finalizadas widget.
  late ExpandableController finalizadasExpandableController;

  // Model for men component.
  late MenModel menModel;

  @override
  void initState(BuildContext context) {
    menModel = createModel(context, () => MenModel());
  }

  @override
  void dispose() {
    aceptadasExpandableController.dispose();
    finalizadasExpandableController.dispose();
    menModel.dispose();
  }
}
