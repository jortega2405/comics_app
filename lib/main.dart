import 'package:comics_app/models/comic_model.dart';
import 'package:comics_app/models/details_model.dart';
import 'package:comics_app/providers/comic_provider.dart';
import 'package:comics_app/screens/details_screen.dart';
import 'package:comics_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


Future main() async {
 
  WidgetsFlutterBinding.ensureInitialized();
  await inizalitation(null);
  runApp(const AppState());

}

Future inizalitation(BuildContext? context) async {
  await Future.delayed(const Duration(milliseconds: 1000));
}

class AppState  extends StatelessWidget {
  const AppState ({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ComicProvider(),
          lazy: false,
        )
      ],
      child:const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Comic App',
      initialRoute: 'home',
      routes: {
        'home':(context) => HomeScreen(),
        'details':(context) => DetailsScreen(),
      },
      theme: ThemeData.light().copyWith(
        // ignore: deprecated_member_use
        backgroundColor: Colors.blueGrey,
        appBarTheme: AppBarTheme(
          color: Colors.grey.withOpacity(0.3)
        )
      ), 
    );
  }
}
