import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rumah_singgah/providers/room_provider.dart';
import 'package:rumah_singgah/ui/pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RoomProvider(),
      child: MaterialApp(
        home: SplashPage(),
      ),
    );
  }
}
