// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// PRUEBA OSCAR
// Custom Action: initializeOneSignal
import 'package:onesignal_flutter/onesignal_flutter.dart';

Future<void> initializeOneSignal() async {
  try {
    // Configurar nivel de logs para depuración
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    OneSignal.Debug.setAlertLevel(OSLogLevel.none);

    // Inicializa OneSignal con tu App ID
    OneSignal.initialize("fba1928f-8b58-4431-9ece-808ee8059532");

    OneSignal.LiveActivities.setupDefault();
    OneSignal.Notifications.clearAll();

    // Solicita permiso para notificaciones push
    await OneSignal.Notifications.requestPermission(true);

    print('✅ OneSignal inicializado correctamente');
  } catch (e) {
    print('❌ Error en initializeOneSignal: $e');
  }
}
