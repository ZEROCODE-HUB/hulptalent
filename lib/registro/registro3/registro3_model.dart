import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'registro3_widget.dart' show Registro3Widget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Registro3Model extends FlutterFlowModel<Registro3Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for dropdownEntidad widget.
  String? dropdownEntidadValue;
  FormFieldController<String>? dropdownEntidadValueController;
  // State field(s) for dropdowTipoCuenta widget.
  String? dropdowTipoCuentaValue;
  FormFieldController<String>? dropdowTipoCuentaValueController;
  // State field(s) for numberAccount widget.
  FocusNode? numberAccountFocusNode;
  TextEditingController? numberAccountTextController;
  String? Function(BuildContext, String?)? numberAccountTextControllerValidator;
  String? _numberAccountTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El numero de cuenta es obligatorio';
    }

    if (val.length > 25) {
      return '25  caracteres maximo';
    }

    return null;
  }

  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El nombre del titular es obligatorio';
    }

    if (val.length > 25) {
      return '25 caracteres maximo';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    numberAccountTextControllerValidator =
        _numberAccountTextControllerValidator;
    nameTextControllerValidator = _nameTextControllerValidator;
  }

  @override
  void dispose() {
    numberAccountFocusNode?.dispose();
    numberAccountTextController?.dispose();

    nameFocusNode?.dispose();
    nameTextController?.dispose();
  }
}
