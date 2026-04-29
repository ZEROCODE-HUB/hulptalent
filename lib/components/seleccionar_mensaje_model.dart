import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/recibo_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'seleccionar_mensaje_widget.dart' show SeleccionarMensajeWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SeleccionarMensajeModel
    extends FlutterFlowModel<SeleccionarMensajeWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadDataKiqgaleria = false;
  FFUploadedFile uploadedLocalFile_uploadDataKiqgaleria =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataKiqgaleria = '';

  bool isDataUploading_uploadDataCamera = false;
  FFUploadedFile uploadedLocalFile_uploadDataCamera =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataCamera = '';

  bool isDataUploading_uploadDataVideo = false;
  FFUploadedFile uploadedLocalFile_uploadDataVideo =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataVideo = '';

  bool isDataUploading_uploadData8Archivo = false;
  FFUploadedFile uploadedLocalFile_uploadData8Archivo =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData8Archivo = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
