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
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'soporte_model.dart';
export 'soporte_model.dart';

class SoporteWidget extends StatefulWidget {
  const SoporteWidget({super.key});

  static String routeName = 'Soporte';
  static String routePath = '/soporte';

  @override
  State<SoporteWidget> createState() => _SoporteWidgetState();
}

class _SoporteWidgetState extends State<SoporteWidget> {
  late SoporteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SoporteModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    // On page dispose action.
    () async {
      FFAppState().soporte = [];
      FFAppState().update(() {});
    }();

    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
            'Soporte',
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
          elevation: 0.5,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Builder(
                        builder: (context) {
                          final conversaciones = FFAppState()
                              .soporte
                              .sortedList(keyOf: (e) => e.fecha, desc: false)
                              .toList();

                          return ListView.separated(
                            padding: EdgeInsets.fromLTRB(
                              0,
                              0,
                              0,
                              20.0,
                            ),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: conversaciones.length,
                            separatorBuilder: (_, __) => SizedBox(height: 40.0),
                            itemBuilder: (context, conversacionesIndex) {
                              final conversacionesItem =
                                  conversaciones[conversacionesIndex];
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  if (conversacionesItem.rol == 'user')
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: ChatUserWidget(
                                        key: Key(
                                            'Keyk2r_${conversacionesIndex}_of_${conversaciones.length}'),
                                        texto: conversacionesItem.mensaje,
                                      ),
                                    ),
                                  if (conversacionesItem.rol == 'soporte')
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: ChatIAWidget(
                                        key: Key(
                                            'Keyowe_${conversacionesIndex}_of_${conversaciones.length}'),
                                        texto: valueOrDefault<String>(
                                          conversacionesItem.mensaje,
                                          '-',
                                        ),
                                      ),
                                    ),
                                ]
                                    .divide(SizedBox(height: 8.0))
                                    .addToEnd(SizedBox(height: 12.0)),
                              );
                            },
                            controller: _model.chatlistScrollController,
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Container(
                        height: 44.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFFBFAF9),
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(
                            color: Color(0xFFDFDFDF),
                            width: 1.0,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    isDismissible: false,
                                    useSafeArea: true,
                                    context: context,
                                    builder: (context) {
                                      return GestureDetector(
                                        onTap: () {
                                          FocusScope.of(context).unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: SoporteSeleccion2Widget(
                                            action: (respuesta) async {
                                              FFAppState().addToSoporte(
                                                  SoporteMensajesStruct(
                                                rol: 'soporte',
                                                mensaje: respuesta,
                                                fecha: getCurrentTimestamp
                                                    .toString(),
                                              ));
                                              FFAppState().update(() {});
                                              Navigator.pop(context);
                                              await Future.delayed(
                                                Duration(
                                                  milliseconds: 1000,
                                                ),
                                              );
                                              await _model
                                                  .chatlistScrollController
                                                  ?.animateTo(
                                                _model.chatlistScrollController!
                                                    .position.maxScrollExtent,
                                                duration:
                                                    Duration(milliseconds: 100),
                                                curve: Curves.ease,
                                              );
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                child: Container(
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(),
                                  child: Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Seleccionar un mensaje',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 12.0, 0.0),
                              child: Container(
                                width: 32.0,
                                height: 32.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF757575),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await _model.chatlistScrollController
                                        ?.animateTo(
                                      _model.chatlistScrollController!.position
                                          .maxScrollExtent,
                                      duration: Duration(milliseconds: 100),
                                      curve: Curves.ease,
                                    );
                                  },
                                  child: Icon(
                                    Icons.send,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    size: 16.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
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
                index: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
