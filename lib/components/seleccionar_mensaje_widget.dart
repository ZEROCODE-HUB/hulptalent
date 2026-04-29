import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/recibo_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'seleccionar_mensaje_model.dart';
export 'seleccionar_mensaje_model.dart';

class SeleccionarMensajeWidget extends StatefulWidget {
  const SeleccionarMensajeWidget({
    super.key,
    required this.idChat,
    this.solicitudID,
  });

  final String? idChat;
  final String? solicitudID;

  @override
  State<SeleccionarMensajeWidget> createState() =>
      _SeleccionarMensajeWidgetState();
}

class _SeleccionarMensajeWidgetState extends State<SeleccionarMensajeWidget> {
  late SeleccionarMensajeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SeleccionarMensajeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 470.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 8.0,
                color: Color(0x33000000),
                offset: Offset(
                  0.0,
                  2.0,
                ),
                spreadRadius: 0.0,
              )
            ],
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Seleccionar archivo',
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            font: GoogleFonts.interTight(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .fontStyle,
                          ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 16.0,
                      buttonSize: 32.0,
                      fillColor: Colors.transparent,
                      icon: Icon(
                        Icons.close,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 20.0,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).accent4,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Builder(
                            builder: (context) => FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 20.0,
                              buttonSize: 60.0,
                              fillColor: Colors.transparent,
                              icon: Icon(
                                Icons.receipt_long,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 28.0,
                              ),
                              onPressed: () async {
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: ReciboWidget(
                                        chatIDR: widget!.idChat!,
                                        solicitudiD: widget!.solicitudID!,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        Text(
                          'Recibo',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontStyle,
                              ),
                        ),
                      ].divide(SizedBox(height: 8.0)),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).accent4,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 20.0,
                            buttonSize: 60.0,
                            fillColor: Colors.transparent,
                            icon: Icon(
                              Icons.photo_library,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 28.0,
                            ),
                            onPressed: () async {
                              final selectedMedia = await selectMedia(
                                storageFolderPath: 'archivos',
                                maxWidth: 1080.00,
                                maxHeight: 1080.00,
                                mediaSource: MediaSource.photoGallery,
                                multiImage: false,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                safeSetState(() => _model
                                        .isDataUploading_uploadDataKiqgaleria =
                                    true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                var downloadUrls = <String>[];
                                try {
                                  showUploadMessage(
                                    context,
                                    'Uploading file...',
                                    showLoading: true,
                                  );
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                            blurHash: m.blurHash,
                                            originalFilename:
                                                m.originalFilename,
                                          ))
                                      .toList();

                                  downloadUrls =
                                      await uploadSupabaseStorageFiles(
                                    bucketName: 'chats',
                                    selectedFiles: selectedMedia,
                                  );
                                } finally {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  _model.isDataUploading_uploadDataKiqgaleria =
                                      false;
                                }
                                if (selectedUploadedFiles.length ==
                                        selectedMedia.length &&
                                    downloadUrls.length ==
                                        selectedMedia.length) {
                                  safeSetState(() {
                                    _model.uploadedLocalFile_uploadDataKiqgaleria =
                                        selectedUploadedFiles.first;
                                    _model.uploadedFileUrl_uploadDataKiqgaleria =
                                        downloadUrls.first;
                                  });
                                  showUploadMessage(context, 'Success!');
                                } else {
                                  safeSetState(() {});
                                  showUploadMessage(
                                      context, 'Failed to upload data');
                                  return;
                                }
                              }

                              if (_model.uploadedFileUrl_uploadDataKiqgaleria !=
                                      null &&
                                  _model.uploadedFileUrl_uploadDataKiqgaleria !=
                                      '') {
                                await MensajesChatTable().insert({
                                  'chat_id': widget!.idChat,
                                  'remitente_id': currentUserUid,
                                  'rol_remitente': 'proveedor',
                                  'tipo_mensaje': 'imagen',
                                  'archivo_url': _model
                                      .uploadedFileUrl_uploadDataKiqgaleria,
                                });
                                Navigator.pop(context);
                              } else {
                                Navigator.pop(context);
                              }
                            },
                          ),
                        ),
                        Text(
                          'Fotos',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                        ),
                      ].divide(SizedBox(height: 8.0)),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).accent4,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 20.0,
                            buttonSize: 60.0,
                            fillColor: Colors.transparent,
                            icon: Icon(
                              Icons.camera_alt,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 28.0,
                            ),
                            onPressed: () async {
                              final selectedMedia = await selectMedia(
                                storageFolderPath: 'archivos',
                                multiImage: false,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                safeSetState(() => _model
                                    .isDataUploading_uploadDataCamera = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                var downloadUrls = <String>[];
                                try {
                                  showUploadMessage(
                                    context,
                                    'Uploading file...',
                                    showLoading: true,
                                  );
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                            blurHash: m.blurHash,
                                            originalFilename:
                                                m.originalFilename,
                                          ))
                                      .toList();

                                  downloadUrls =
                                      await uploadSupabaseStorageFiles(
                                    bucketName: 'chats',
                                    selectedFiles: selectedMedia,
                                  );
                                } finally {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  _model.isDataUploading_uploadDataCamera =
                                      false;
                                }
                                if (selectedUploadedFiles.length ==
                                        selectedMedia.length &&
                                    downloadUrls.length ==
                                        selectedMedia.length) {
                                  safeSetState(() {
                                    _model.uploadedLocalFile_uploadDataCamera =
                                        selectedUploadedFiles.first;
                                    _model.uploadedFileUrl_uploadDataCamera =
                                        downloadUrls.first;
                                  });
                                  showUploadMessage(context, 'Success!');
                                } else {
                                  safeSetState(() {});
                                  showUploadMessage(
                                      context, 'Failed to upload data');
                                  return;
                                }
                              }

                              if (_model.uploadedFileUrl_uploadDataCamera !=
                                      null &&
                                  _model.uploadedFileUrl_uploadDataCamera !=
                                      '') {
                                await MensajesChatTable().insert({
                                  'chat_id': widget!.idChat,
                                  'remitente_id': currentUserUid,
                                  'rol_remitente': 'proveedor',
                                  'tipo_mensaje': 'imagen',
                                  'archivo_url':
                                      _model.uploadedFileUrl_uploadDataCamera,
                                });
                                Navigator.pop(context);
                                return;
                              } else {
                                Navigator.pop(context);
                                return;
                              }
                            },
                          ),
                        ),
                        Text(
                          'Cámara',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                        ),
                      ].divide(SizedBox(height: 8.0)),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).accent4,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 20.0,
                            buttonSize: 60.0,
                            fillColor: Colors.transparent,
                            icon: Icon(
                              Icons.play_circle_fill,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 28.0,
                            ),
                            onPressed: () async {
                              final selectedMedia =
                                  await selectMediaWithSourceBottomSheet(
                                context: context,
                                storageFolderPath: 'archivos',
                                allowPhoto: false,
                                allowVideo: true,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                safeSetState(() => _model
                                    .isDataUploading_uploadDataVideo = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                var downloadUrls = <String>[];
                                try {
                                  showUploadMessage(
                                    context,
                                    'Uploading file...',
                                    showLoading: true,
                                  );
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                            blurHash: m.blurHash,
                                            originalFilename:
                                                m.originalFilename,
                                          ))
                                      .toList();

                                  downloadUrls =
                                      await uploadSupabaseStorageFiles(
                                    bucketName: 'chats',
                                    selectedFiles: selectedMedia,
                                  );
                                } finally {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  _model.isDataUploading_uploadDataVideo =
                                      false;
                                }
                                if (selectedUploadedFiles.length ==
                                        selectedMedia.length &&
                                    downloadUrls.length ==
                                        selectedMedia.length) {
                                  safeSetState(() {
                                    _model.uploadedLocalFile_uploadDataVideo =
                                        selectedUploadedFiles.first;
                                    _model.uploadedFileUrl_uploadDataVideo =
                                        downloadUrls.first;
                                  });
                                  showUploadMessage(context, 'Success!');
                                } else {
                                  safeSetState(() {});
                                  showUploadMessage(
                                      context, 'Failed to upload data');
                                  return;
                                }
                              }

                              if (_model.uploadedFileUrl_uploadDataVideo !=
                                      null &&
                                  _model.uploadedFileUrl_uploadDataVideo !=
                                      '') {
                                await MensajesChatTable().insert({
                                  'chat_id': widget!.idChat,
                                  'remitente_id': currentUserUid,
                                  'rol_remitente': 'proveedor',
                                  'tipo_mensaje': 'video',
                                  'archivo_url':
                                      _model.uploadedFileUrl_uploadDataVideo,
                                });
                                Navigator.pop(context);
                                return;
                              } else {
                                Navigator.pop(context);
                                return;
                              }
                            },
                          ),
                        ),
                        Text(
                          'Video',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                        ),
                      ].divide(SizedBox(height: 8.0)),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).accent4,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 20.0,
                            buttonSize: 60.0,
                            fillColor: Colors.transparent,
                            icon: Icon(
                              Icons.description,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 28.0,
                            ),
                            onPressed: () async {
                              final selectedFiles = await selectFiles(
                                storageFolderPath: 'archivos',
                                multiFile: false,
                              );
                              if (selectedFiles != null) {
                                safeSetState(() => _model
                                    .isDataUploading_uploadData8Archivo = true);
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
                                            originalFilename:
                                                m.originalFilename,
                                          ))
                                      .toList();

                                  downloadUrls =
                                      await uploadSupabaseStorageFiles(
                                    bucketName: 'chats',
                                    selectedFiles: selectedFiles,
                                  );
                                } finally {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  _model.isDataUploading_uploadData8Archivo =
                                      false;
                                }
                                if (selectedUploadedFiles.length ==
                                        selectedFiles.length &&
                                    downloadUrls.length ==
                                        selectedFiles.length) {
                                  safeSetState(() {
                                    _model.uploadedLocalFile_uploadData8Archivo =
                                        selectedUploadedFiles.first;
                                    _model.uploadedFileUrl_uploadData8Archivo =
                                        downloadUrls.first;
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

                              if (_model.uploadedFileUrl_uploadData8Archivo !=
                                      null &&
                                  _model.uploadedFileUrl_uploadData8Archivo !=
                                      '') {
                                await MensajesChatTable().insert({
                                  'chat_id': widget!.idChat,
                                  'remitente_id': currentUserUid,
                                  'rol_remitente': 'proveedor',
                                  'tipo_mensaje': 'documento',
                                  'archivo_url':
                                      _model.uploadedFileUrl_uploadData8Archivo,
                                });
                                Navigator.pop(context);
                                return;
                              } else {
                                Navigator.pop(context);
                                return;
                              }
                            },
                          ),
                        ),
                        Text(
                          'Documento',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                        ),
                      ].divide(SizedBox(height: 8.0)),
                    ),
                  ],
                ),
              ].divide(SizedBox(height: 20.0)),
            ),
          ),
        ),
      ),
    );
  }
}
