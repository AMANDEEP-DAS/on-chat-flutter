import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:on_chat/screens/chat_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegScreen extends StatefulWidget {
  String id = 'reg_screen';

  @override
  _RegScreenState createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
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
              Material(color: Colors.blueAccent,elevation: 5,borderRadius: BorderRadius.circular(30),child: MaterialButton(minWidth: 200,height: 42,
                  onPressed: () async{
                setState(() {
                  showSpinner = true;
                });
                try{
                  final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                  if(newUser != null){
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
                  },
                  child: Text('Register'))),
            ],
          ),
        ),
      ),
    );
  }
}
