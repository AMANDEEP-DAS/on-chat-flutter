import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:on_chat/screens/chat_screen.dart';
import 'package:on_chat/screens/login_screen.dart';
import 'package:on_chat/screens/registration_screen.dart';
import 'package:on_chat/screens/welcome_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(OnChat());
}

class OnChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen().id,
      // initialRoute: ChatScreen().id,
      routes: {
        WelcomeScreen().id: (ctx) => WelcomeScreen(),
        LoginScreen().id: (ctx) => LoginScreen(),
        RegScreen().id: (ctx) => RegScreen(),
        ChatScreen().id: (ctx) => ChatScreen(),
      },
    );
  }
}
