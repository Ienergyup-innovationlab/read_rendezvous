
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'lib/provider/providers.dart';
import 'lib/splash_screen/splash_screen.dart';





void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: Providers.getProvider,
        builder: (_, __) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ReadRendezvous',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  ResponsiveSizer(
        builder: (context, orientation, screenType) {
      return const Splash();})
    ));
  }
}


