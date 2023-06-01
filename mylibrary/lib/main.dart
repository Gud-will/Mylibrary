import 'package:flutter/material.dart';
import 'package:mylibrary/ui/bookinfocard.dart';
import 'package:mylibrary/ui/imageholder.dart';
import 'package:mylibrary/ui/uicolors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 25),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: bgcolor,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 600,
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: const [
                BookInfoCard(),
                Imageholder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
