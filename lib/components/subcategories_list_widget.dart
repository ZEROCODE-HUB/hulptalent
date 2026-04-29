import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'subcategories_list_model.dart';
export 'subcategories_list_model.dart';

class SubcategoriesListWidget extends StatefulWidget {
  const SubcategoriesListWidget({
    super.key,
    required this.catnom,
    required this.idcat,
  });

  final String? catnom;
  final String? idcat;

  @override
  State<SubcategoriesListWidget> createState() =>
      _SubcategoriesListWidgetState();
}

class _SubcategoriesListWidgetState extends State<SubcategoriesListWidget> {
  late SubcategoriesListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubcategoriesListModel());

    _model.expansibleCategoriesExpandableController =
        ExpandableController(initialExpanded: false)
          ..addListener(() => safeSetState(() {}));
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
      decoration: BoxDecoration(),
      child: Container(
        width: double.infinity,
        color: Color(0x00000000),
        child: ExpandableNotifier(
          controller: _model.expansibleCategoriesExpandableController,
          child: ExpandablePanel(
            header: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Theme(
                  data: ThemeData(
                    checkboxTheme: CheckboxThemeData(
                      visualDensity: VisualDensity.compact,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    unselectedWidgetColor:
                        FlutterFlowTheme.of(context).alternate,
                  ),
                  child: Checkbox(
                    value: _model.checkboxServiceValue ??= false,
                    onChanged: (newValue) async {
                      safeSetState(
                          () => _model.checkboxServiceValue = newValue!);
                    },
                    side: (FlutterFlowTheme.of(context).alternate != null)
                        ? BorderSide(
                            width: 2,
                            color: FlutterFlowTheme.of(context).alternate!,
                          )
                        : null,
                    activeColor: FlutterFlowTheme.of(context).primary,
                    checkColor: FlutterFlowTheme.of(context).info,
                  ),
                ),
                Text(
                  widget!.catnom!,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ],
            ),
            collapsed: Container(),
            expanded: Container(
              decoration: BoxDecoration(),
              child: StreamBuilder<List<SubcategoriasRow>>(
                stream: _model.listViewSupabaseStream ??= SupaFlow.client
                    .from("subcategorias")
                    .stream(primaryKey: ['id'])
                    .eqOrNull(
                      'categoria_id',
                      widget!.idcat,
                    )
                    .map((list) =>
                        list.map((item) => SubcategoriasRow(item)).toList()),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  List<SubcategoriasRow> listViewSubcategoriasRowList =
                      snapshot.data!;

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewSubcategoriasRowList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewSubcategoriasRow =
                          listViewSubcategoriasRowList[listViewIndex];
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Theme(
                            data: ThemeData(
                              checkboxTheme: CheckboxThemeData(
                                visualDensity: VisualDensity.compact,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              unselectedWidgetColor:
                                  FlutterFlowTheme.of(context).alternate,
                            ),
                            child: Checkbox(
                              value: _model.subcategoriaValueMap[
                                  listViewSubcategoriasRow] ??= false,
                              onChanged: (newValue) async {
                                safeSetState(() => _model.subcategoriaValueMap[
                                    listViewSubcategoriasRow] = newValue!);
                              },
                              side: (FlutterFlowTheme.of(context).alternate !=
                                      null)
                                  ? BorderSide(
                                      width: 2,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate!,
                                    )
                                  : null,
                              activeColor: FlutterFlowTheme.of(context).primary,
                              checkColor: FlutterFlowTheme.of(context).info,
                            ),
                          ),
                          Text(
                            listViewSubcategoriasRow.nombre,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Color(0x8A000000),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            theme: ExpandableThemeData(
              tapHeaderToExpand: true,
              tapBodyToExpand: false,
              tapBodyToCollapse: false,
              headerAlignment: ExpandablePanelHeaderAlignment.center,
              hasIcon: true,
            ),
          ),
        ),
      ),
    );
  }
}
