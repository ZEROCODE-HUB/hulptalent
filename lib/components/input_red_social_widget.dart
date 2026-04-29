import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'input_red_social_model.dart';
export 'input_red_social_model.dart';

class InputRedSocialWidget extends StatefulWidget {
  const InputRedSocialWidget({
    super.key,
    this.parameter1,
  });

  final String? parameter1;

  @override
  State<InputRedSocialWidget> createState() => _InputRedSocialWidgetState();
}

class _InputRedSocialWidgetState extends State<InputRedSocialWidget> {
  late InputRedSocialModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InputRedSocialModel());

    _model.inputProfileRedSocialTextController ??=
        TextEditingController(text: widget!.parameter1);
    _model.inputProfileRedSocialFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        child: TextFormField(
          controller: _model.inputProfileRedSocialTextController,
          focusNode: _model.inputProfileRedSocialFocusNode,
          onChanged: (_) => EasyDebounce.debounce(
            '_model.inputProfileRedSocialTextController',
            Duration(milliseconds: 2000),
            () async {
              FFAppState().updateRegistroStruct(
                (e) => e
                  ..updateRedesSociales(
                    (e) => e.add(''),
                  ),
              );
              safeSetState(() {});
            },
          ),
          autofocus: false,
          obscureText: false,
          decoration: InputDecoration(
            isDense: true,
            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                  font: GoogleFonts.inter(
                    fontWeight:
                        FlutterFlowTheme.of(context).labelMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelMedium.fontStyle,
                  ),
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).labelMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                ),
            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                  font: GoogleFonts.inter(
                    fontWeight:
                        FlutterFlowTheme.of(context).labelMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).tertiary,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).labelMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).bordesTextField,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).bordesTextField,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            filled: true,
            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.inter(
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
                letterSpacing: 0.0,
                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
          maxLength: 25,
          cursorColor: FlutterFlowTheme.of(context).primaryText,
          validator: _model.inputProfileRedSocialTextControllerValidator
              .asValidator(context),
        ),
      ),
    );
  }
}
