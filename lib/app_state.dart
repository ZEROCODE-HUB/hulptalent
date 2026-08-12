import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _soporte = prefs
              .getStringList('ff_soporte')
              ?.map((x) {
                try {
                  return SoporteMensajesStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _soporte;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  PerfilStruct _registro = PerfilStruct.fromSerializableMap(
      jsonDecode('{\"certificaciones\":\"[]\",\"referencias\":\"[]\"}'));
  PerfilStruct get registro => _registro;
  set registro(PerfilStruct value) {
    _registro = value;
  }

  void updateRegistroStruct(Function(PerfilStruct) updateFn) {
    updateFn(_registro);
  }

  /// Marca que el registro en curso proviene de un proveedor externo (Apple):
  /// la sesión de Supabase ya existe, así que se omite el paso de contraseña y
  /// no se vuelve a crear la cuenta al finalizar el asistente.
  /// No se persiste a propósito: debe morir si la app se cierra a medias.
  bool _registroExterno = false;
  bool get registroExterno => _registroExterno;
  set registroExterno(bool value) {
    _registroExterno = value;
  }

  List<String> _idServiciosList = [];
  List<String> get idServiciosList => _idServiciosList;
  set idServiciosList(List<String> value) {
    _idServiciosList = value;
  }

  void addToIdServiciosList(String value) {
    idServiciosList.add(value);
  }

  void removeFromIdServiciosList(String value) {
    idServiciosList.remove(value);
  }

  void removeAtIndexFromIdServiciosList(int index) {
    idServiciosList.removeAt(index);
  }

  void updateIdServiciosListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    idServiciosList[index] = updateFn(_idServiciosList[index]);
  }

  void insertAtIndexInIdServiciosList(int index, String value) {
    idServiciosList.insert(index, value);
  }

  List<SoporteMensajesStruct> _soporte = [];
  List<SoporteMensajesStruct> get soporte => _soporte;
  set soporte(List<SoporteMensajesStruct> value) {
    _soporte = value;
    prefs.setStringList('ff_soporte', value.map((x) => x.serialize()).toList());
  }

  void addToSoporte(SoporteMensajesStruct value) {
    soporte.add(value);
    prefs.setStringList(
        'ff_soporte', _soporte.map((x) => x.serialize()).toList());
  }

  void removeFromSoporte(SoporteMensajesStruct value) {
    soporte.remove(value);
    prefs.setStringList(
        'ff_soporte', _soporte.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromSoporte(int index) {
    soporte.removeAt(index);
    prefs.setStringList(
        'ff_soporte', _soporte.map((x) => x.serialize()).toList());
  }

  void updateSoporteAtIndex(
    int index,
    SoporteMensajesStruct Function(SoporteMensajesStruct) updateFn,
  ) {
    soporte[index] = updateFn(_soporte[index]);
    prefs.setStringList(
        'ff_soporte', _soporte.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInSoporte(int index, SoporteMensajesStruct value) {
    soporte.insert(index, value);
    prefs.setStringList(
        'ff_soporte', _soporte.map((x) => x.serialize()).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
