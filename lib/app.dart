import 'package:book_app/routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      /// Setting up initial route
      initialRoute: CustomRoutes.initialRoute,
      /// Setting up routes
      routes: CustomRoutes.routes,
      /// Adding dark theme to app
      theme: ThemeData.dark().copyWith(
        /// Adding page transition animation
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
    );
  }
}
