import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mylibrary/api/apiget.dart';
import 'package:mylibrary/screens/search_page.dart';
import 'package:mylibrary/ui/bookcard.dart';
import 'package:mylibrary/ui/uicolors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final User? user = FirebaseAuth.instance.currentUser;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: user != null ? const MyHomePage() : LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 10, bottom: 20),
        height: MediaQuery.of(context).size.height,
        decoration: bgcolor,
        child: Align(
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {
              signInWithGoogle();
            },
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/btn_google_signin_dark_pressed_web.png"),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FocusNode searchbar = FocusNode();
  var change=false;
  List<BookData> books=[];
  TextEditingController _searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Container(
        padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: bgcolor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SearchBar(
              hintText: "Enter Book name here",
              controller: _searchcontroller,
              onChanged: (value) async{
                books=await APIService().get();
                setState(() {
                  change=true;
                });
              },
            ),
            change?Expanded(child:SearchList(books:books)):CarouselSlider(
              items: const [
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
                BookCard(),
              ],
              options: CarouselOptions(
                height: 600,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
