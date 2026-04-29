import '/backend/schema/structs/index.dart';
import '/components/subirdocumentoregistro2_widget.dart';
import '/components/textfieldregistro2_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'registro2_widget.dart' show Registro2Widget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Registro2Model extends FlutterFlowModel<Registro2Widget> {
  ///  Local state fields for this page.
  /// s
  List<CertificacionesStruct> certificacioness = [];
  void addToCertificacioness(CertificacionesStruct item) =>
      certificacioness.add(item);
  void removeFromCertificacioness(CertificacionesStruct item) =>
      certificacioness.remove(item);
  void removeAtIndexFromCertificacioness(int index) =>
      certificacioness.removeAt(index);
  void insertAtIndexInCertificacioness(int index, CertificacionesStruct item) =>
      certificacioness.insert(index, item);
  void updateCertificacionessAtIndex(
          int index, Function(CertificacionesStruct) updateFn) =>
      certificacioness[index] = updateFn(certificacioness[index]);

  List<ReferenciasStruct> referencias = [];
  void addToReferencias(ReferenciasStruct item) => referencias.add(item);
  void removeFromReferencias(ReferenciasStruct item) =>
      referencias.remove(item);
  void removeAtIndexFromReferencias(int index) => referencias.removeAt(index);
  void insertAtIndexInReferencias(int index, ReferenciasStruct item) =>
      referencias.insert(index, item);
  void updateReferenciasAtIndex(
          int index, Function(ReferenciasStruct) updateFn) =>
      referencias[index] = updateFn(referencias[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for yearexperience widget.
  FocusNode? yearexperienceFocusNode;
  TextEditingController? yearexperienceTextController;
  String? Function(BuildContext, String?)?
      yearexperienceTextControllerValidator;
  String? _yearexperienceTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Los años de experiencia son obligatorios';
    }

    return null;
  }

  // State field(s) for siCertificacion widget.
  bool? siCertificacionValue;
  // State field(s) for noCertificacion widget.
  bool? noCertificacionValue;
  // State field(s) for siReferencia widget.
  bool? siReferenciaValue;
  // State field(s) for noReferencia widget.
  bool? noReferenciaValue;
  // State field(s) for siRuc widget.
  bool? siRucValue;
  // State field(s) for noRuc widget.
  bool? noRucValue;
  // State field(s) for inputNIT widget.
  FocusNode? inputNITFocusNode;
  TextEditingController? inputNITTextController;
  String? Function(BuildContext, String?)? inputNITTextControllerValidator;

  @override
  void initState(BuildContext context) {
    yearexperienceTextControllerValidator =
        _yearexperienceTextControllerValidator;
  }

  @override
  void dispose() {
    yearexperienceFocusNode?.dispose();
    yearexperienceTextController?.dispose();

    inputNITFocusNode?.dispose();
    inputNITTextController?.dispose();
  }
}
