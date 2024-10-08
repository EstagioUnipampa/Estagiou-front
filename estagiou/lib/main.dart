import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/auth_module.dart';
import 'package:flutter_application_1/features/auth/view/auth_company.dart';
import 'package:flutter_application_1/features/auth/view/auth_page.dart';
import 'package:flutter_application_1/features/auth/view/auth_student.dart';
import 'package:flutter_application_1/features/auth/view/components/custom_bottom_nav.dart';
import 'package:flutter_application_1/features/documents/view/documents_view.dart';
import 'package:flutter_application_1/features/home/view/home_page.dart';
import 'package:flutter_application_1/features/home/view/home_profile.dart';
import 'package:flutter_application_1/features/registrations/view/registrations_view.dart';
import 'package:flutter_application_1/shared/module/core_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const MainApp()));
}

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void exportedBinds(i) {}

  @override
  List<Module> get imports => [AuthModule(), CoreModule()];

  @override
  void routes(r) {
    r.child('/', child: (context) => const AuthPage());
    r.child(
      '/login',
      child: (context) => const AuthStudent(),
    );
    r.child('/company-login', child: (context) => const AuthCompany());
    r.child('/home', child: (context) => const CustomBottomNav(), children: [
      ChildRoute('/homePage', child: (context) => const HomePage()),
      ChildRoute('/documents', child: (context) => const DocumentsView()),
      ChildRoute('/registrations',
          child: (context) => const RegistrationsView()),
      ChildRoute('/profile', child: (context) => const HomeProfile()),
    ]);
    r.module('/auth', module: AuthModule());
  }
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
      backButtonDispatcher:
          RootBackButtonDispatcher(), // Habilita o botão de voltar
      theme: ThemeData(
        fontFamily: 'Poppins',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: const Color(0xFF23A331),
          ),
        ),
      ),
    );
  }
}
