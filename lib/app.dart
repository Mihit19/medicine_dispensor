import 'package:apptofiretorasbpi/bindings/general_bindings.dart';
import 'package:apptofiretorasbpi/features/authentication/screens/login/login.dart';
import 'package:apptofiretorasbpi/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Firebase Demo',
        routes: {
        '/login': (context) => const LoginScreen(),}, // Define the route for login screen
      themeMode: ThemeMode.system,
      theme: EEAppTheme.lightTheme,
      darkTheme: EEAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      home: const LoginScreen(),
    );
  }
}