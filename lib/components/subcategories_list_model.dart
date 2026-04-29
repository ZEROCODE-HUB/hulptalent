import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'subcategories_list_widget.dart' show SubcategoriesListWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SubcategoriesListModel extends FlutterFlowModel<SubcategoriesListWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for expansibleCategories widget.
  late ExpandableController expansibleCategoriesExpandableController;

  // State field(s) for checkboxService widget.
  bool? checkboxServiceValue;
  Stream<List<SubcategoriasRow>>? listViewSupabaseStream;
  // State field(s) for subcategoria widget.
  Map<SubcategoriasRow, bool> subcategoriaValueMap = {};
  List<SubcategoriasRow> get subcategoriaCheckedItems =>
      subcategoriaValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expansibleCategoriesExpandableController.dispose();
  }
}
