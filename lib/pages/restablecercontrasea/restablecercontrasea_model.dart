import '/auth/supabase_auth/auth_util.dart';
import '/components/notificacion_error_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'restablecercontrasea_widget.dart' show RestablecercontraseaWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RestablecercontraseaModel
    extends FlutterFlowModel<RestablecercontraseaWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextFieldPassword widget.
  FocusNode? textFieldPasswordFocusNode;
  TextEditingController? textFieldPasswordTextController;
  late bool textFieldPasswordVisibility;
  String? Function(BuildContext, String?)?
      textFieldPasswordTextControllerValidator;
  String? _textFieldPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'La nueva contraseña es obligatoria';
    }
    if (val.length < 8) {
      return 'Minimo 8 caracteres';
    }
    if (!RegExp(r'[A-Z]').hasMatch(val)) {
      return 'Debe contener al menos una mayuscula';
    }
    if (!RegExp(r'[0-9]').hasMatch(val)) {
      return 'Debe contener al menos un numero';
    }
    return null;
  }

  // State field(s) for TextFieldPassword2 widget.
  FocusNode? textFieldPassword2FocusNode;
  TextEditingController? textFieldPassword2TextController;
  late bool textFieldPassword2Visibility;
  String? Function(BuildContext, String?)?
      textFieldPassword2TextControllerValidator;
  String? _textFieldPassword2TextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Confirme la contraseña';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    textFieldPasswordVisibility = false;
    textFieldPasswordTextControllerValidator =
        _textFieldPasswordTextControllerValidator;
    textFieldPassword2Visibility = false;
    textFieldPassword2TextControllerValidator =
        _textFieldPassword2TextControllerValidator;
  }

  @override
  void dispose() {
    textFieldPasswordFocusNode?.dispose();
    textFieldPasswordTextController?.dispose();

    textFieldPassword2FocusNode?.dispose();
    textFieldPassword2TextController?.dispose();
  }
}
