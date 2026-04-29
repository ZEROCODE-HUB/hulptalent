import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/servicio_asignado_error_widget.dart';
import '/components/servicio_asignado_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'aceptar_servicio_widget.dart' show AceptarServicioWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AceptarServicioModel extends FlutterFlowModel<AceptarServicioWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<SolicitudesServicioRow>? validacion;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<TarjetasGuardadasRow>? tarjeta;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsuariosRow>? usuarioServicio;
  // Stores action output result for [Custom Action - getAcceptanceToken] action in Button widget.
  dynamic? aceptaceToken;
  // Stores action output result for [Custom Action - createTransaction] action in Button widget.
  dynamic? pago;
  // Stores action output result for [Backend Call - API (sendNotificationUserHulp)] action in Button widget.
  ApiCallResponse? apNotificacion;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
