import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'textfieldregistro2_model.dart';
export 'textfieldregistro2_model.dart';

class Textfieldregistro2Widget extends StatefulWidget {
  const Textfieldregistro2Widget({
    super.key,
    this.index,
    required this.action,
    required this.titulo,
    this.initialValue,
  });

  final int? index;
  final Future Function(String? texto)? action;
  final String? titulo;
  final String? initialValue;

  @override
  State<Textfieldregistro2Widget> createState() =>
      _Textfieldregistro2WidgetState();
}

class _Textfieldregistro2WidgetState extends State<Textfieldregistro2Widget> {
  late Textfieldregistro2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Textfieldregistro2Model());

    _model.textController ??= TextEditingController(text: widget!.initialValue);
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(
      () async {
        await widget.action?.call(
          _model.textController.text,
        );
      },
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      child: TextFormField(
        controller: _model.textController,
        focusNode: _model.textFieldFocusNode,
        onChanged: (_) => EasyDebounce.debounce(
          '_model.textController',
          Duration(milliseconds: 100),
          () async {
            await widget.action?.call(
              _model.textController.text,
            );
          },
        ),
        autofocus: false,
        obscureText: false,
        decoration: InputDecoration(
          isDense: true,
          labelText: widget!.titulo,
          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                font: GoogleFonts.inter(
                  fontWeight:
                      FlutterFlowTheme.of(context).labelMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                ),
                color: FlutterFlowTheme.of(context).textos1,
                fontSize: 16.0,
                letterSpacing: 0.0,
                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
              ),
          hintText: widget!.titulo,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFB7B1A7),
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFB7B1A7),
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
          fillColor: FlutterFlowTheme.of(context).primaryBackground,
        ),
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              font: GoogleFonts.inter(
                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
              fontSize: 16.0,
              letterSpacing: 0.0,
              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
            ),
        cursorColor: FlutterFlowTheme.of(context).primaryText,
        validator: _model.textControllerValidator.asValidator(context),
      ),
    );
  }
}
