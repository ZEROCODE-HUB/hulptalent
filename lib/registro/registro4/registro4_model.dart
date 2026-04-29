import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'registro4_widget.dart' show Registro4Widget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Registro4Model extends FlutterFlowModel<Registro4Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Contraseña es requerido';
    }

    if (val.length < 10) {
      return 'La contraseña debe tener entre 10 y 16 caracteres';
    }
    if (val.length > 16) {
      return 'La contraseña debe tener entre 8 y 16 caracteres';
    }
    if (!RegExp('^(?=.*\\d)(?=.*[.@#\$%^&+=!¡¿?*()_~\\-]).+\$').hasMatch(val)) {
      return 'La contraseña debe incluir al menos un número \ny un símbolo (como @, #, \$, %, etc.).';
    }
    return null;
  }

  // State field(s) for confirmedPassword widget.
  FocusNode? confirmedPasswordFocusNode;
  TextEditingController? confirmedPasswordTextController;
  late bool confirmedPasswordVisibility;
  String? Function(BuildContext, String?)?
      confirmedPasswordTextControllerValidator;
  String? _confirmedPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Debe confirmar la contraseña';
    }

    if (val.length < 10) {
      return 'La contraseña debe tener entre 10 y 16 caracteres';
    }
    if (val.length > 16) {
      return 'La contraseña debe tener entre 10 y 16 caracteres';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
    confirmedPasswordVisibility = false;
    confirmedPasswordTextControllerValidator =
        _confirmedPasswordTextControllerValidator;
  }

  @override
  void dispose() {
    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    confirmedPasswordFocusNode?.dispose();
    confirmedPasswordTextController?.dispose();
  }
}
