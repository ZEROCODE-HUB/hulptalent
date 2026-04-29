import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/item_widget.dart';
import '/components/lista_vacia_widget.dart';
import '/components/notificacion_error_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'recibo_widget.dart' show ReciboWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReciboModel extends FlutterFlowModel<ReciboWidget> {
  ///  Local state fields for this component.

  List<ItemsReciboStruct> items = [];
  void addToItems(ItemsReciboStruct item) => items.add(item);
  void removeFromItems(ItemsReciboStruct item) => items.remove(item);
  void removeAtIndexFromItems(int index) => items.removeAt(index);
  void insertAtIndexInItems(int index, ItemsReciboStruct item) =>
      items.insert(index, item);
  void updateItemsAtIndex(int index, Function(ItemsReciboStruct) updateFn) =>
      items[index] = updateFn(items[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingresa un título';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  RecibosRow? reciboid;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
