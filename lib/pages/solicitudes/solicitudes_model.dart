import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/cancelar_servicio_widget.dart';
import '/components/finalizar_servicio_widget.dart';
import '/components/lista_vacia_widget.dart';
import '/components/men_widget.dart';
import '/components/nueva_version_widget.dart';
import '/components/servicio_asignado_inicio_widget.dart';
import '/components/soporte_seleccion_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'solicitudes_widget.dart' show SolicitudesWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SolicitudesModel extends FlutterFlowModel<SolicitudesWidget> {
  ///  Local state fields for this page.

  bool notificationEnabled = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - areNotificationsEnabled] action in Solicitudes widget.
  bool? notificacionActiva;
  // Stores action output result for [Backend Call - Query Rows] action in Solicitudes widget.
  List<AppVersionRow>? versionDb2;
  // Stores action output result for [Custom Action - getVersion] action in Solicitudes widget.
  String? appVersion2;
  Stream<List<AppVersionRow>>? containerSupabaseStream1;
  Stream<List<SolicitudesServicioRow>>? containerSupabaseStream2;
  Stream<List<UsuariosRow>>? containerSupabaseStream3;
  // State field(s) for Switch widget.
  bool? switchValue;
  Stream<List<SolicitudesServicioRow>>? containerSupabaseStream4;
  // Stores action output result for [Backend Call - API (sendNotificationUser)] action in Button widget.
  ApiCallResponse? apiResultwgo21;
  // State field(s) for aceptadas widget.
  late ExpandableController aceptadasExpandableController;

  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<VwSolicitudesServiciosCompletaRow>? vvsid;
  // Stores action output result for [Backend Call - API (sendNotificationUser)] action in Button widget.
  ApiCallResponse? apiResultwgo;
  // Stores action output result for [Backend Call - API (sendNotificationUser)] action in Button widget.
  ApiCallResponse? apiResult3;
  // Stores action output result for [Backend Call - API (sendNotificationUser)] action in Button widget.
  ApiCallResponse? apiResult4;
  // State field(s) for finalizadas widget.
  late ExpandableController finalizadasExpandableController;

  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<VwSolicitudesServiciosCompletaRow>? vvsidd;
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
