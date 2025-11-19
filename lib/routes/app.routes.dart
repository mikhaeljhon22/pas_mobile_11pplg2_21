import 'package:flutter/material.dart';
import 'package:pas_mobile_11pplg2_21/page/favourite.page.dart';
import 'package:pas_mobile_11pplg2_21/page/home.page.dart';
import 'package:pas_mobile_11pplg2_21/page/login.page.dart';
import 'package:pas_mobile_11pplg2_21/page/profile.page.dart';
import 'package:pas_mobile_11pplg2_21/page/register.page.dart';
import 'package:pas_mobile_11pplg2_21/page/splash.page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/': (_) => const LoginPage(),
    '/login': (_) => const LoginPage(),
    '/register': (_) => const RegisterPage(),
    '/home': (_) => const HomePage(),
    '/favorites': (_) => const FavoritePage(),
    '/profile': (_) => const ProfilePage(),
    "/splash": (context) => const SplashPage(),
  };
}
