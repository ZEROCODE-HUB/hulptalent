// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReferenciasStruct extends BaseStruct {
  ReferenciasStruct({
    String? nombres,
    String? telefono,
    String? relacion,
  })  : _nombres = nombres,
        _telefono = telefono,
        _relacion = relacion;

  // "nombres" field.
  String? _nombres;
  String get nombres => _nombres ?? '';
  set nombres(String? val) => _nombres = val;

  bool hasNombres() => _nombres != null;

  // "telefono" field.
  String? _telefono;
  String get telefono => _telefono ?? '';
  set telefono(String? val) => _telefono = val;

  bool hasTelefono() => _telefono != null;

  // "relacion" field.
  String? _relacion;
  String get relacion => _relacion ?? '';
  set relacion(String? val) => _relacion = val;

  bool hasRelacion() => _relacion != null;

  static ReferenciasStruct fromMap(Map<String, dynamic> data) =>
      ReferenciasStruct(
        nombres: data['nombres'] as String?,
        telefono: data['telefono'] as String?,
        relacion: data['relacion'] as String?,
      );

  static ReferenciasStruct? maybeFromMap(dynamic data) => data is Map
      ? ReferenciasStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'nombres': _nombres,
        'telefono': _telefono,
        'relacion': _relacion,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nombres': serializeParam(
          _nombres,
          ParamType.String,
        ),
        'telefono': serializeParam(
          _telefono,
          ParamType.String,
        ),
        'relacion': serializeParam(
          _relacion,
          ParamType.String,
        ),
      }.withoutNulls;

  static ReferenciasStruct fromSerializableMap(Map<String, dynamic> data) =>
      ReferenciasStruct(
        nombres: deserializeParam(
          data['nombres'],
          ParamType.String,
          false,
        ),
        telefono: deserializeParam(
          data['telefono'],
          ParamType.String,
          false,
        ),
        relacion: deserializeParam(
          data['relacion'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ReferenciasStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ReferenciasStruct &&
        nombres == other.nombres &&
        telefono == other.telefono &&
        relacion == other.relacion;
  }

  @override
  int get hashCode => const ListEquality().hash([nombres, telefono, relacion]);
}

ReferenciasStruct createReferenciasStruct({
  String? nombres,
  String? telefono,
  String? relacion,
}) =>
    ReferenciasStruct(
      nombres: nombres,
      telefono: telefono,
      relacion: relacion,
    );
