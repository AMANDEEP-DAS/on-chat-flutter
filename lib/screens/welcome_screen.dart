import 'package:flutter/material.dart';
import 'package:on_chat/screens/registration_screen.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: [
                  Colors.blueAccent,
                  Colors.white,
                ],
                stops: [0.0, 1.0],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                // tileMode: TileMode.repeated
            )
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [Column(
                  children: [
                    Row(
                          children: [
                            Hero(tag:'logo',child: Container(child: Image.asset('assets/on_chat_logo.png',fit: BoxFit.cover,height: 50,width: 50,),)),
                            SizedBox(width: 10,),
                            Text('On Chat',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 45),),
                          ],
                        ),
                  ],
                ),
                  SizedBox(height: 10,),
                  Material(color: Colors.lightBlueAccent,elevation: 5,borderRadius: BorderRadius.circular(30),child: MaterialButton(minWidth: 200,height: 42,onPressed: (){Navigator.pushNamed(context, LoginScreen().id);}, child: Text('Log In'))),
                  SizedBox(height: 10,),
                  Material(color: Colors.blueAccent,elevation: 5,borderRadius: BorderRadius.circular(30),child: MaterialButton(minWidth: 200,height: 42,onPressed: (){Navigator.pushNamed(context, RegScreen().id);}, child: Text('Register'))),
                ],
              ),
        ),
      ),
    );
  }
}
