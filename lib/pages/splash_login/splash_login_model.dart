import '/auth/base_auth_user_provider.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'splash_login_widget.dart' show SplashLoginWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SplashLoginModel extends FlutterFlowModel<SplashLoginWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in SplashLogin widget.
  List<AppVersionRow>? versionBD;
  // Stores action output result for [Backend Call - Query Rows] action in SplashLogin widget.
  List<UsuariosRow>? miususario;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
