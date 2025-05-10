import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/utilities/routes/routes.dart';
import 'package:flutter_mvvm_provider/utilities/routes/routes_name.dart';
import 'package:flutter_mvvm_provider/utilities/utils.dart';
import 'package:flutter_mvvm_provider/view/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: (){
            Utils.flustBarErrorMessage(context, 'no internet connection');
            // Utils.toastMessage('Click Me');
    
          } ,
          child: Text('test'),
        ),
      ),
      );
    
  }
}