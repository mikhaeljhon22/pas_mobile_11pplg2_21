import 'package:flutter/material.dart';
import 'package:pas_mobile_11pplg2_21/routes/app.routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PAS Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/splash',
      routes: AppRoutes.routes,
    );
  }
}
