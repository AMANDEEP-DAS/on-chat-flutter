import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                colors: [
                  Colors.blueAccent,
                  Colors.white,
                ],
                stops: [0.0, 1.0],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                tileMode: TileMode.repeated
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset('assets/on_chat_logo.png',fit: BoxFit.cover,height: 100,width: 100,),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value){
                  email = value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                onChanged: (value){
                  password = value;
                },
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                ),
              ),
              SizedBox(height: 10,),
              Material(color: Colors.lightBlueAccent,elevation: 5,borderRadius: BorderRadius.circular(30),child: MaterialButton(minWidth: 200,height: 42, child: Text('Log In'),
              onPressed: () async{
                setState(() {
                  showSpinner = true;
                });
                try{
                  final User = await _auth.signInWithEmailAndPassword(email: email, password: password);
                  if(User != null){
                    Navigator.pushNamed(context, ChatScreen().id);
                  }
                }
                catch(e){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.redAccent,
                    content: Wrap(
                      children: [
                        Text("$e",style: TextStyle(color: Colors.black),),
                      ],
                    ),
                  ));
                }
                setState(() {
                  showSpinner = false;
                });
              },)),
            ],
          ),
        ),
      ),
    );
  }
}
