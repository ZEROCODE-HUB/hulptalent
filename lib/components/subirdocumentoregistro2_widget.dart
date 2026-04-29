import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'subirdocumentoregistro2_model.dart';
export 'subirdocumentoregistro2_model.dart';

class Subirdocumentoregistro2Widget extends StatefulWidget {
  const Subirdocumentoregistro2Widget({
    super.key,
    this.index,
    required this.action,
    required this.archivo,
  });

  final int? index;
  final Future Function(String? link)? action;
  final String? archivo;

  @override
  State<Subirdocumentoregistro2Widget> createState() =>
      _Subirdocumentoregistro2WidgetState();
}

class _Subirdocumentoregistro2WidgetState
    extends State<Subirdocumentoregistro2Widget> {
  late Subirdocumentoregistro2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Subirdocumentoregistro2Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        final selectedFiles = await selectFiles(
          storageFolderPath: 'certificaciones',
          multiFile: false,
        );
        if (selectedFiles != null) {
          safeSetState(() => _model.isDataUploading_certificacionlink = true);
          var selectedUploadedFiles = <FFUploadedFile>[];

          var downloadUrls = <String>[];
          try {
            showUploadMessage(
              context,
              'Uploading file...',
              showLoading: true,
            );
            selectedUploadedFiles = selectedFiles
                .map((m) => FFUploadedFile(
                      name: m.storagePath.split('/').last,
                      bytes: m.bytes,
                      originalFilename: m.originalFilename,
                    ))
                .toList();

            downloadUrls = await uploadSupabaseStorageFiles(
              bucketName: 'archivos',
              selectedFiles: selectedFiles,
            );
          } finally {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            _model.isDataUploading_certificacionlink = false;
          }
          if (selectedUploadedFiles.length == selectedFiles.length &&
              downloadUrls.length == selectedFiles.length) {
            safeSetState(() {
              _model.uploadedLocalFile_certificacionlink =
                  selectedUploadedFiles.first;
              _model.uploadedFileUrl_certificacionlink = downloadUrls.first;
            });
            showUploadMessage(
              context,
              'Success!',
            );
          } else {
            safeSetState(() {});
            showUploadMessage(
              context,
              'Failed to upload file',
            );
            return;
          }
        }

        await widget.action?.call(
          _model.uploadedFileUrl_certificacionlink,
        );
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: 100.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).textos1,
            width: 1.0,
          ),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(28.0, 0.0, 28.0, 0.0),
            child: Text(
              (_model.uploadedFileUrl_certificacionlink != null &&
                          _model.uploadedFileUrl_certificacionlink != '') ||
                      (widget!.archivo != null && widget!.archivo != '')
                  ? 'Archivo subido'
                  : 'Haz click aquí para seleccionar el archivo',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.inter(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).textos1,
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
