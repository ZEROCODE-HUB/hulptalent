import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'subirdocumentoregistro2_widget.dart' show Subirdocumentoregistro2Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Subirdocumentoregistro2Model
    extends FlutterFlowModel<Subirdocumentoregistro2Widget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading_certificacionlink = false;
  FFUploadedFile uploadedLocalFile_certificacionlink =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_certificacionlink = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
