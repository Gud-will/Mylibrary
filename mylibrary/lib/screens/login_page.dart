import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mylibrary/methods/signin_method.dart';
import 'package:mylibrary/screens/home_page.dart';
import 'package:mylibrary/ui/uicolors.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserCredential user;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 10, bottom: 20),
        height: MediaQuery.of(context).size.height,
        decoration: bgcolor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 16 / 10,
              child: Image.asset("assets/6538623-removebg-preview.png"),
            ),
            const Text("Login"),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () async{
                user = await signInWithGoogle();
                if (user.user != null) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: ((context) => MyHomePage(user: user.user)),
                    ),
                  );
                }
              },
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width - 40,
                child: Image.asset(
                    'assets/btn_google_signin_dark_pressed_web.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
