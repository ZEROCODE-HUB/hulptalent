// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PerfilStruct extends BaseStruct {
  PerfilStruct({
    String? foto,
    String? nombres,
    String? apellidos,
    String? tipodocumento,
    String? numerodocumento,
    String? ciudad,
    String? direccion,
    String? pais,
    String? telefono,
    String? correo,
    int? anosexp,
    List<CertificacionesStruct>? certificaciones,
    List<ReferenciasStruct>? referencias,
    String? tributario,
    String? entidad,
    String? tipodecuenta,
    String? numerodecuenta,
    String? nombretitular,
    String? contrasena,
    List<String>? redesSociales,
  })  : _foto = foto,
        _nombres = nombres,
        _apellidos = apellidos,
        _tipodocumento = tipodocumento,
        _numerodocumento = numerodocumento,
        _ciudad = ciudad,
        _direccion = direccion,
        _pais = pais,
        _telefono = telefono,
        _correo = correo,
        _anosexp = anosexp,
        _certificaciones = certificaciones,
        _referencias = referencias,
        _tributario = tributario,
        _entidad = entidad,
        _tipodecuenta = tipodecuenta,
        _numerodecuenta = numerodecuenta,
        _nombretitular = nombretitular,
        _contrasena = contrasena,
        _redesSociales = redesSociales;

  // "foto" field.
  String? _foto;
  String get foto => _foto ?? '';
  set foto(String? val) => _foto = val;

  bool hasFoto() => _foto != null;

  // "nombres" field.
  String? _nombres;
  String get nombres => _nombres ?? '';
  set nombres(String? val) => _nombres = val;

  bool hasNombres() => _nombres != null;

  // "apellidos" field.
  String? _apellidos;
  String get apellidos => _apellidos ?? '';
  set apellidos(String? val) => _apellidos = val;

  bool hasApellidos() => _apellidos != null;

  // "tipodocumento" field.
  String? _tipodocumento;
  String get tipodocumento => _tipodocumento ?? '';
  set tipodocumento(String? val) => _tipodocumento = val;

  bool hasTipodocumento() => _tipodocumento != null;

  // "numerodocumento" field.
  String? _numerodocumento;
  String get numerodocumento => _numerodocumento ?? '';
  set numerodocumento(String? val) => _numerodocumento = val;

  bool hasNumerodocumento() => _numerodocumento != null;

  // "ciudad" field.
  String? _ciudad;
  String get ciudad => _ciudad ?? '';
  set ciudad(String? val) => _ciudad = val;

  bool hasCiudad() => _ciudad != null;

  // "direccion" field.
  String? _direccion;
  String get direccion => _direccion ?? '';
  set direccion(String? val) => _direccion = val;

  bool hasDireccion() => _direccion != null;

  // "pais" field.
  String? _pais;
  String get pais => _pais ?? '';
  set pais(String? val) => _pais = val;

  bool hasPais() => _pais != null;

  // "telefono" field.
  String? _telefono;
  String get telefono => _telefono ?? '';
  set telefono(String? val) => _telefono = val;

  bool hasTelefono() => _telefono != null;

  // "correo" field.
  String? _correo;
  String get correo => _correo ?? '';
  set correo(String? val) => _correo = val;

  bool hasCorreo() => _correo != null;

  // "anosexp" field.
  int? _anosexp;
  int get anosexp => _anosexp ?? 0;
  set anosexp(int? val) => _anosexp = val;

  void incrementAnosexp(int amount) => anosexp = anosexp + amount;

  bool hasAnosexp() => _anosexp != null;

  // "certificaciones" field.
  List<CertificacionesStruct>? _certificaciones;
  List<CertificacionesStruct> get certificaciones =>
      _certificaciones ?? const [];
  set certificaciones(List<CertificacionesStruct>? val) =>
      _certificaciones = val;

  void updateCertificaciones(Function(List<CertificacionesStruct>) updateFn) {
    updateFn(_certificaciones ??= []);
  }

  bool hasCertificaciones() => _certificaciones != null;

  // "referencias" field.
  List<ReferenciasStruct>? _referencias;
  List<ReferenciasStruct> get referencias => _referencias ?? const [];
  set referencias(List<ReferenciasStruct>? val) => _referencias = val;

  void updateReferencias(Function(List<ReferenciasStruct>) updateFn) {
    updateFn(_referencias ??= []);
  }

  bool hasReferencias() => _referencias != null;

  // "tributario" field.
  String? _tributario;
  String get tributario => _tributario ?? '';
  set tributario(String? val) => _tributario = val;

  bool hasTributario() => _tributario != null;

  // "entidad" field.
  String? _entidad;
  String get entidad => _entidad ?? '';
  set entidad(String? val) => _entidad = val;

  bool hasEntidad() => _entidad != null;

  // "tipodecuenta" field.
  String? _tipodecuenta;
  String get tipodecuenta => _tipodecuenta ?? '';
  set tipodecuenta(String? val) => _tipodecuenta = val;

  bool hasTipodecuenta() => _tipodecuenta != null;

  // "numerodecuenta" field.
  String? _numerodecuenta;
  String get numerodecuenta => _numerodecuenta ?? '';
  set numerodecuenta(String? val) => _numerodecuenta = val;

  bool hasNumerodecuenta() => _numerodecuenta != null;

  // "nombretitular" field.
  String? _nombretitular;
  String get nombretitular => _nombretitular ?? '';
  set nombretitular(String? val) => _nombretitular = val;

  bool hasNombretitular() => _nombretitular != null;

  // "contrasena" field.
  String? _contrasena;
  String get contrasena => _contrasena ?? '';
  set contrasena(String? val) => _contrasena = val;

  bool hasContrasena() => _contrasena != null;

  // "redes_sociales" field.
  List<String>? _redesSociales;
  List<String> get redesSociales => _redesSociales ?? const [];
  set redesSociales(List<String>? val) => _redesSociales = val;

  void updateRedesSociales(Function(List<String>) updateFn) {
    updateFn(_redesSociales ??= []);
  }

  bool hasRedesSociales() => _redesSociales != null;

  static PerfilStruct fromMap(Map<String, dynamic> data) => PerfilStruct(
        foto: data['foto'] as String?,
        nombres: data['nombres'] as String?,
        apellidos: data['apellidos'] as String?,
        tipodocumento: data['tipodocumento'] as String?,
        numerodocumento: data['numerodocumento'] as String?,
        ciudad: data['ciudad'] as String?,
        direccion: data['direccion'] as String?,
        pais: data['pais'] as String?,
        telefono: data['telefono'] as String?,
        correo: data['correo'] as String?,
        anosexp: castToType<int>(data['anosexp']),
        certificaciones: getStructList(
          data['certificaciones'],
          CertificacionesStruct.fromMap,
        ),
        referencias: getStructList(
          data['referencias'],
          ReferenciasStruct.fromMap,
        ),
        tributario: data['tributario'] as String?,
        entidad: data['entidad'] as String?,
        tipodecuenta: data['tipodecuenta'] as String?,
        numerodecuenta: data['numerodecuenta'] as String?,
        nombretitular: data['nombretitular'] as String?,
        contrasena: data['contrasena'] as String?,
        redesSociales: getDataList(data['redes_sociales']),
      );

  static PerfilStruct? maybeFromMap(dynamic data) =>
      data is Map ? PerfilStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'foto': _foto,
        'nombres': _nombres,
        'apellidos': _apellidos,
        'tipodocumento': _tipodocumento,
        'numerodocumento': _numerodocumento,
        'ciudad': _ciudad,
        'direccion': _direccion,
        'pais': _pais,
        'telefono': _telefono,
        'correo': _correo,
        'anosexp': _anosexp,
        'certificaciones': _certificaciones?.map((e) => e.toMap()).toList(),
        'referencias': _referencias?.map((e) => e.toMap()).toList(),
        'tributario': _tributario,
        'entidad': _entidad,
        'tipodecuenta': _tipodecuenta,
        'numerodecuenta': _numerodecuenta,
        'nombretitular': _nombretitular,
        'contrasena': _contrasena,
        'redes_sociales': _redesSociales,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'foto': serializeParam(
          _foto,
          ParamType.String,
        ),
        'nombres': serializeParam(
          _nombres,
          ParamType.String,
        ),
        'apellidos': serializeParam(
          _apellidos,
          ParamType.String,
        ),
        'tipodocumento': serializeParam(
          _tipodocumento,
          ParamType.String,
        ),
        'numerodocumento': serializeParam(
          _numerodocumento,
          ParamType.String,
        ),
        'ciudad': serializeParam(
          _ciudad,
          ParamType.String,
        ),
        'direccion': serializeParam(
          _direccion,
          ParamType.String,
        ),
        'pais': serializeParam(
          _pais,
          ParamType.String,
        ),
        'telefono': serializeParam(
          _telefono,
          ParamType.String,
        ),
        'correo': serializeParam(
          _correo,
          ParamType.String,
        ),
        'anosexp': serializeParam(
          _anosexp,
          ParamType.int,
        ),
        'certificaciones': serializeParam(
          _certificaciones,
          ParamType.DataStruct,
          isList: true,
        ),
        'referencias': serializeParam(
          _referencias,
          ParamType.DataStruct,
          isList: true,
        ),
        'tributario': serializeParam(
          _tributario,
          ParamType.String,
        ),
        'entidad': serializeParam(
          _entidad,
          ParamType.String,
        ),
        'tipodecuenta': serializeParam(
          _tipodecuenta,
          ParamType.String,
        ),
        'numerodecuenta': serializeParam(
          _numerodecuenta,
          ParamType.String,
        ),
        'nombretitular': serializeParam(
          _nombretitular,
          ParamType.String,
        ),
        'contrasena': serializeParam(
          _contrasena,
          ParamType.String,
        ),
        'redes_sociales': serializeParam(
          _redesSociales,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static PerfilStruct fromSerializableMap(Map<String, dynamic> data) =>
      PerfilStruct(
        foto: deserializeParam(
          data['foto'],
          ParamType.String,
          false,
        ),
        nombres: deserializeParam(
          data['nombres'],
          ParamType.String,
          false,
        ),
        apellidos: deserializeParam(
          data['apellidos'],
          ParamType.String,
          false,
        ),
        tipodocumento: deserializeParam(
          data['tipodocumento'],
          ParamType.String,
          false,
        ),
        numerodocumento: deserializeParam(
          data['numerodocumento'],
          ParamType.String,
          false,
        ),
        ciudad: deserializeParam(
          data['ciudad'],
          ParamType.String,
          false,
        ),
        direccion: deserializeParam(
          data['direccion'],
          ParamType.String,
          false,
        ),
        pais: deserializeParam(
          data['pais'],
          ParamType.String,
          false,
        ),
        telefono: deserializeParam(
          data['telefono'],
          ParamType.String,
          false,
        ),
        correo: deserializeParam(
          data['correo'],
          ParamType.String,
          false,
        ),
        anosexp: deserializeParam(
          data['anosexp'],
          ParamType.int,
          false,
        ),
        certificaciones: deserializeStructParam<CertificacionesStruct>(
          data['certificaciones'],
          ParamType.DataStruct,
          true,
          structBuilder: CertificacionesStruct.fromSerializableMap,
        ),
        referencias: deserializeStructParam<ReferenciasStruct>(
          data['referencias'],
          ParamType.DataStruct,
          true,
          structBuilder: ReferenciasStruct.fromSerializableMap,
        ),
        tributario: deserializeParam(
          data['tributario'],
          ParamType.String,
          false,
        ),
        entidad: deserializeParam(
          data['entidad'],
          ParamType.String,
          false,
        ),
        tipodecuenta: deserializeParam(
          data['tipodecuenta'],
          ParamType.String,
          false,
        ),
        numerodecuenta: deserializeParam(
          data['numerodecuenta'],
          ParamType.String,
          false,
        ),
        nombretitular: deserializeParam(
          data['nombretitular'],
          ParamType.String,
          false,
        ),
        contrasena: deserializeParam(
          data['contrasena'],
          ParamType.String,
          false,
        ),
        redesSociales: deserializeParam<String>(
          data['redes_sociales'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'PerfilStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PerfilStruct &&
        foto == other.foto &&
        nombres == other.nombres &&
        apellidos == other.apellidos &&
        tipodocumento == other.tipodocumento &&
        numerodocumento == other.numerodocumento &&
        ciudad == other.ciudad &&
        direccion == other.direccion &&
        pais == other.pais &&
        telefono == other.telefono &&
        correo == other.correo &&
        anosexp == other.anosexp &&
        listEquality.equals(certificaciones, other.certificaciones) &&
        listEquality.equals(referencias, other.referencias) &&
        tributario == other.tributario &&
        entidad == other.entidad &&
        tipodecuenta == other.tipodecuenta &&
        numerodecuenta == other.numerodecuenta &&
        nombretitular == other.nombretitular &&
        contrasena == other.contrasena &&
        listEquality.equals(redesSociales, other.redesSociales);
  }

  @override
  int get hashCode => const ListEquality().hash([
        foto,
        nombres,
        apellidos,
        tipodocumento,
        numerodocumento,
        ciudad,
        direccion,
        pais,
        telefono,
        correo,
        anosexp,
        certificaciones,
        referencias,
        tributario,
        entidad,
        tipodecuenta,
        numerodecuenta,
        nombretitular,
        contrasena,
        redesSociales
      ]);
}

PerfilStruct createPerfilStruct({
  String? foto,
  String? nombres,
  String? apellidos,
  String? tipodocumento,
  String? numerodocumento,
  String? ciudad,
  String? direccion,
  String? pais,
  String? telefono,
  String? correo,
  int? anosexp,
  String? tributario,
  String? entidad,
  String? tipodecuenta,
  String? numerodecuenta,
  String? nombretitular,
  String? contrasena,
}) =>
    PerfilStruct(
      foto: foto,
      nombres: nombres,
      apellidos: apellidos,
      tipodocumento: tipodocumento,
      numerodocumento: numerodocumento,
      ciudad: ciudad,
      direccion: direccion,
      pais: pais,
      telefono: telefono,
      correo: correo,
      anosexp: anosexp,
      tributario: tributario,
      entidad: entidad,
      tipodecuenta: tipodecuenta,
      numerodecuenta: numerodecuenta,
      nombretitular: nombretitular,
      contrasena: contrasena,
    );
