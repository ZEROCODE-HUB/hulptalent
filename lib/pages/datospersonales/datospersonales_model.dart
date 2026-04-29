import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'datospersonales_widget.dart' show DatospersonalesWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DatospersonalesModel extends FlutterFlowModel<DatospersonalesWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nombre widget.
  FocusNode? nombreFocusNode;
  TextEditingController? nombreTextController;
  String? Function(BuildContext, String?)? nombreTextControllerValidator;
  String? _nombreTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Nombre es obligatorio';
    }

    return null;
  }

  // State field(s) for apellido widget.
  FocusNode? apellidoFocusNode;
  TextEditingController? apellidoTextController;
  String? Function(BuildContext, String?)? apellidoTextControllerValidator;
  String? _apellidoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Apellido es obligatorio';
    }

    return null;
  }

  // State field(s) for tipoDocumento widget.
  String? tipoDocumentoValue;
  FormFieldController<String>? tipoDocumentoValueController;
  // State field(s) for NumeroDocumento widget.
  FocusNode? numeroDocumentoFocusNode;
  TextEditingController? numeroDocumentoTextController;
  String? Function(BuildContext, String?)?
      numeroDocumentoTextControllerValidator;
  String? _numeroDocumentoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Numero de documento es obligatorio';
    }

    return null;
  }

  // State field(s) for Pais widget.
  String? paisValue;
  FormFieldController<String>? paisValueController;
  // State field(s) for Telefono widget.
  FocusNode? telefonoFocusNode;
  TextEditingController? telefonoTextController;
  String? Function(BuildContext, String?)? telefonoTextControllerValidator;
  String? _telefonoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Telefono es obligatorio';
    }

    return null;
  }

  // State field(s) for Direccion widget.
  FocusNode? direccionFocusNode;
  TextEditingController? direccionTextController;
  String? Function(BuildContext, String?)? direccionTextControllerValidator;

  @override
  void initState(BuildContext context) {
    nombreTextControllerValidator = _nombreTextControllerValidator;
    apellidoTextControllerValidator = _apellidoTextControllerValidator;
    numeroDocumentoTextControllerValidator =
        _numeroDocumentoTextControllerValidator;
    telefonoTextControllerValidator = _telefonoTextControllerValidator;
  }

  @override
  void dispose() {
    nombreFocusNode?.dispose();
    nombreTextController?.dispose();

    apellidoFocusNode?.dispose();
    apellidoTextController?.dispose();

    numeroDocumentoFocusNode?.dispose();
    numeroDocumentoTextController?.dispose();

    telefonoFocusNode?.dispose();
    telefonoTextController?.dispose();

    direccionFocusNode?.dispose();
    direccionTextController?.dispose();
  }
}
