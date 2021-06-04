import 'package:crud/res/custom_collors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  /*
  FocusNode é um objeto que pode ser usado por um widget com monitoração de estado para obter o foco 
  do teclado e manipular eventos do teclado
  */
  final FocusNode _uidFocusNode = FocusNode();

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeFirebase(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error initializing Firebase');
        } else if (snapshot.connectionState == ConnectionState.done) {
          return Text('Firebase initialized');
        }
        return CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            CustomColors.firebaseOrange,
          ),
        );
      },
    );
  }
}
