import '/auth/base_auth_user_provider.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'splash_login_model.dart';
export 'splash_login_model.dart';

class SplashLoginWidget extends StatefulWidget {
  const SplashLoginWidget({super.key});

  static String routeName = 'SplashLogin';
  static String routePath = '/splashLogin';

  @override
  State<SplashLoginWidget> createState() => _SplashLoginWidgetState();
}

class _SplashLoginWidgetState extends State<SplashLoginWidget> {
  late SplashLoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashLoginModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.versionBD = await AppVersionTable().queryRows(
        queryFn: (q) => q,
      );
      if (loggedIn) {
        _model.miususario = await UsuariosTable().queryRows(
          queryFn: (q) => q.eqOrNull(
            'id',
            currentUserUid,
          ),
        );
        if (_model.miususario?.firstOrNull?.verificado == 'no verificado') {
          context.goNamedAuth(
            VerificacionPageWidget.routeName,
            context.mounted,
            queryParameters: {
              'estado': serializeParam(
                _model.miususario?.firstOrNull?.verificado,
                ParamType.String,
              ),
            }.withoutNulls,
            extra: <String, dynamic>{
              '__transition_info__': TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 0),
              ),
            },
          );

          return;
        } else if (_model.miususario?.firstOrNull?.verificado == 'verificado') {
          context.goNamedAuth(
            SolicitudesWidget.routeName,
            context.mounted,
            extra: <String, dynamic>{
              '__transition_info__': TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 0),
              ),
            },
          );

          return;
        } else if (_model.miususario?.firstOrNull?.verificado == 'pendiente') {
          context.goNamedAuth(
            VerificacionPageWidget.routeName,
            context.mounted,
            queryParameters: {
              'estado': serializeParam(
                _model.miususario?.firstOrNull?.verificado,
                ParamType.String,
              ),
            }.withoutNulls,
            extra: <String, dynamic>{
              '__transition_info__': TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 0),
              ),
            },
          );

          return;
        } else if (_model.miususario?.firstOrNull?.verificado ==
            'sin documentos') {
          context.pushNamedAuth(
            VerificacionPageWidget.routeName,
            context.mounted,
            queryParameters: {
              'estado': serializeParam(
                'sin documentos',
                ParamType.String,
              ),
            }.withoutNulls,
          );

          return;
        } else if (_model.miususario?.isEmpty ?? true) {
          // Sesión válida sin perfil: es una cuenta de proveedor externo
          // (Apple) que no terminó el registro. Se retoma el asistente en vez
          // de cerrar la sesión.
          FFAppState().registroExterno = true;
          FFAppState().updateRegistroStruct((registro) {
            final metadata =
                SupaFlow.client.auth.currentUser?.userMetadata ?? const {};
            if (registro.nombres.isEmpty) {
              registro.nombres = metadata['given_name']?.toString() ?? '';
            }
            if (registro.apellidos.isEmpty) {
              registro.apellidos = metadata['family_name']?.toString() ?? '';
            }
            if (registro.correo.isEmpty &&
                !currentUserEmail
                    .toLowerCase()
                    .endsWith('@privaterelay.appleid.com')) {
              registro.correo = currentUserEmail;
            }
          });

          context.goNamedAuth(Registro1Widget.routeName, context.mounted);

          return;
        } else {
          GoRouter.of(context).prepareAuthEvent();
          await authManager.signOut();
          GoRouter.of(context).clearRedirectLocation();

          context.goNamedAuth(
            LoginWidget.routeName,
            context.mounted,
            extra: <String, dynamic>{
              '__transition_info__': TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 0),
              ),
            },
          );

          return;
        }
      } else {
        context.pushNamedAuth(LoginWidget.routeName, context.mounted);

        return;
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [],
          ),
        ),
      ),
    );
  }
}
