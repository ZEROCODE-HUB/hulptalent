import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/men_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'desactivar_cuenta_model.dart';
export 'desactivar_cuenta_model.dart';

class DesactivarCuentaWidget extends StatefulWidget {
  const DesactivarCuentaWidget({super.key});

  static String routeName = 'desactivarCuenta';
  static String routePath = '/desactivarCuenta';

  @override
  State<DesactivarCuentaWidget> createState() => _DesactivarCuentaWidgetState();
}

class _DesactivarCuentaWidgetState extends State<DesactivarCuentaWidget> {
  late DesactivarCuentaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DesactivarCuentaModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  void _mostrarMensaje(String texto, {bool esError = true}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          texto,
          style: TextStyle(
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
        ),
        duration: Duration(milliseconds: 4000),
        backgroundColor: esError
            ? FlutterFlowTheme.of(context).error
            : FlutterFlowTheme.of(context).success,
      ),
    );
  }

  /// Pide confirmación explícita antes de borrar. Devuelve true solo si la
  /// persona confirma; el diálogo no se puede cerrar tocando fuera.
  Future<bool> _confirmar() async {
    final confirmado = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        title: Text('¿Eliminar tu cuenta?'),
        content: Text(
          'Se borrarán tu perfil, certificaciones, referencias, servicios y '
          'datos bancarios de forma permanente. Esta acción no se puede deshacer.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(
              'Eliminar',
              style: TextStyle(color: FlutterFlowTheme.of(context).error),
            ),
          ),
        ],
      ),
    );
    return confirmado ?? false;
  }

  /// Elimina la cuenta de forma permanente.
  ///
  /// Orden importante: primero se revoca el token de Apple (necesita la sesión
  /// viva), después se borran los datos, y solo al final se cierra sesión.
  Future<void> _eliminarCuenta() async {
    if (!await _confirmar()) return;

    safeSetState(() => _model.eliminando = true);
    try {
      final cliente = SupaFlow.client;

      // Paso opcional: si la persona entró con Apple, avisarle a Apple que
      // revoque el token. Si la función no está desplegada todavía, se ignora:
      // no debe impedir que la cuenta se elimine.
      final entroPorApple = cliente.auth.currentUser?.identities
              ?.any((i) => i.provider == 'apple') ??
          false;
      if (entroPorApple) {
        try {
          await cliente.functions.invoke(
            'revocar-apple',
            body: {
              'refresh_token': cliente.auth.currentSession?.refreshToken,
            },
          );
        } catch (e) {
          debugPrint('No se pudo revocar el token de Apple: $e');
        }
      }

      // Borrado real. La RPC valida la sesión por su cuenta y no acepta
      // parámetros, así que nadie puede pedir el borrado de otra persona.
      await cliente.rpc('eliminar_mi_cuenta');
    } catch (e) {
      debugPrint('Error eliminando la cuenta: $e');
      if (mounted) {
        safeSetState(() => _model.eliminando = false);
        _mostrarMensaje('No pudimos eliminar tu cuenta. Intenta más tarde.');
      }
      return;
    }

    if (!mounted) return;

    // A partir de aquí la cuenta YA no existe. El signOut suele devolver 401
    // porque el usuario fue borrado del servidor: da igual, lo que importa es
    // limpiar la sesión local. Un fallo acá no debe reportarse como si el
    // borrado hubiera fallado.
    try {
      GoRouter.of(context).prepareAuthEvent();
      await authManager.signOut();
      GoRouter.of(context).clearRedirectLocation();
    } catch (e) {
      debugPrint('signOut tras eliminar la cuenta: $e');
    }

    if (!mounted) return;
    safeSetState(() => _model.eliminando = false);
    _mostrarMensaje('Tu cuenta fue eliminada', esError: false);
    context.goNamedAuth(LoginWidget.routeName, context.mounted);
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 54.0,
            icon: FaIcon(
              FontAwesomeIcons.angleLeft,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Eliminar Cuenta',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.interTight(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.1,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      textScaler: MediaQuery.of(context).textScaler,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Antes de continuar,',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          TextSpan(
                            text:
                                ' asegúrate de comprender el significado de eliminar tu cuenta.\n\n',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          TextSpan(
                            text: 'Al eliminarla, tu cuenta y tus datos personales ',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          TextSpan(
                            text: 'se eliminarán de forma permanente.\n\n',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          TextSpan(
                            text:
                                'Esta acción no se puede deshacer: perderás tu perfil, tus certificaciones, tus referencias, tus servicios y tus datos bancarios, y no podrás recuperarlos. Si quieres volver a trabajar con Hulp tendrás que registrarte de nuevo desde cero.\n\nPor obligaciones contables conservamos el registro de los pagos ya realizados, sin tus datos de contacto.',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                      child: FFButtonWidget(
                        onPressed:
                            _model.eliminando ? null : () => _eliminarCuenta(),
                        text: _model.eliminando
                            ? 'Eliminando...'
                            : 'Eliminar cuenta',
                        icon: Icon(
                          Icons.person_off,
                          size: 20.0,
                        ),
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFFFDE7EA),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Color(0xFFBC1021),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Color(0xFFEF4354),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            wrapWithModel(
              model: _model.menModel,
              updateCallback: () => safeSetState(() {}),
              child: MenWidget(
                index: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
