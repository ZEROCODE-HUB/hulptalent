// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SoporteMensajesStruct extends BaseStruct {
  SoporteMensajesStruct({
    String? rol,
    String? mensaje,
    String? fecha,
  })  : _rol = rol,
        _mensaje = mensaje,
        _fecha = fecha;

  // "rol" field.
  String? _rol;
  String get rol => _rol ?? '';
  set rol(String? val) => _rol = val;

  bool hasRol() => _rol != null;

  // "mensaje" field.
  String? _mensaje;
  String get mensaje => _mensaje ?? '';
  set mensaje(String? val) => _mensaje = val;

  bool hasMensaje() => _mensaje != null;

  // "fecha" field.
  String? _fecha;
  String get fecha => _fecha ?? '';
  set fecha(String? val) => _fecha = val;

  bool hasFecha() => _fecha != null;

  static SoporteMensajesStruct fromMap(Map<String, dynamic> data) =>
      SoporteMensajesStruct(
        rol: data['rol'] as String?,
        mensaje: data['mensaje'] as String?,
        fecha: data['fecha'] as String?,
      );

  static SoporteMensajesStruct? maybeFromMap(dynamic data) => data is Map
      ? SoporteMensajesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'rol': _rol,
        'mensaje': _mensaje,
        'fecha': _fecha,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'rol': serializeParam(
          _rol,
          ParamType.String,
        ),
        'mensaje': serializeParam(
          _mensaje,
          ParamType.String,
        ),
        'fecha': serializeParam(
          _fecha,
          ParamType.String,
        ),
      }.withoutNulls;

  static SoporteMensajesStruct fromSerializableMap(Map<String, dynamic> data) =>
      SoporteMensajesStruct(
        rol: deserializeParam(
          data['rol'],
          ParamType.String,
          false,
        ),
        mensaje: deserializeParam(
          data['mensaje'],
          ParamType.String,
          false,
        ),
        fecha: deserializeParam(
          data['fecha'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SoporteMensajesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SoporteMensajesStruct &&
        rol == other.rol &&
        mensaje == other.mensaje &&
        fecha == other.fecha;
  }

  @override
  int get hashCode => const ListEquality().hash([rol, mensaje, fecha]);
}

SoporteMensajesStruct createSoporteMensajesStruct({
  String? rol,
  String? mensaje,
  String? fecha,
}) =>
    SoporteMensajesStruct(
      rol: rol,
      mensaje: mensaje,
      fecha: fecha,
    );
