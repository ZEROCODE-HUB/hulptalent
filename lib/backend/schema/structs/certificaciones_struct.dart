// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CertificacionesStruct extends BaseStruct {
  CertificacionesStruct({
    String? nombreentidad,
    String? linkarchivo,
    String? titulo,
  })  : _nombreentidad = nombreentidad,
        _linkarchivo = linkarchivo,
        _titulo = titulo;

  // "nombreentidad" field.
  String? _nombreentidad;
  String get nombreentidad => _nombreentidad ?? '';
  set nombreentidad(String? val) => _nombreentidad = val;

  bool hasNombreentidad() => _nombreentidad != null;

  // "linkarchivo" field.
  String? _linkarchivo;
  String get linkarchivo => _linkarchivo ?? '';
  set linkarchivo(String? val) => _linkarchivo = val;

  bool hasLinkarchivo() => _linkarchivo != null;

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  set titulo(String? val) => _titulo = val;

  bool hasTitulo() => _titulo != null;

  static CertificacionesStruct fromMap(Map<String, dynamic> data) =>
      CertificacionesStruct(
        nombreentidad: data['nombreentidad'] as String?,
        linkarchivo: data['linkarchivo'] as String?,
        titulo: data['titulo'] as String?,
      );

  static CertificacionesStruct? maybeFromMap(dynamic data) => data is Map
      ? CertificacionesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'nombreentidad': _nombreentidad,
        'linkarchivo': _linkarchivo,
        'titulo': _titulo,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nombreentidad': serializeParam(
          _nombreentidad,
          ParamType.String,
        ),
        'linkarchivo': serializeParam(
          _linkarchivo,
          ParamType.String,
        ),
        'titulo': serializeParam(
          _titulo,
          ParamType.String,
        ),
      }.withoutNulls;

  static CertificacionesStruct fromSerializableMap(Map<String, dynamic> data) =>
      CertificacionesStruct(
        nombreentidad: deserializeParam(
          data['nombreentidad'],
          ParamType.String,
          false,
        ),
        linkarchivo: deserializeParam(
          data['linkarchivo'],
          ParamType.String,
          false,
        ),
        titulo: deserializeParam(
          data['titulo'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CertificacionesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CertificacionesStruct &&
        nombreentidad == other.nombreentidad &&
        linkarchivo == other.linkarchivo &&
        titulo == other.titulo;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([nombreentidad, linkarchivo, titulo]);
}

CertificacionesStruct createCertificacionesStruct({
  String? nombreentidad,
  String? linkarchivo,
  String? titulo,
}) =>
    CertificacionesStruct(
      nombreentidad: nombreentidad,
      linkarchivo: linkarchivo,
      titulo: titulo,
    );
