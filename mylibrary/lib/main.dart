import 'package:flutter/material.dart';
import 'package:mylibrary/ui/bookcard.dart';
import 'package:mylibrary/ui/uicolors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
  final PageController pgcontroller = PageController(viewportFraction: 0.8);
  int selectedPg = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 10, bottom: 20),
        height: MediaQuery.of(context).size.height,
        decoration: bgcolor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 600,
              child: PageView(
                pageSnapping: false,
                controller: pgcontroller,
                children: [
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
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: SmoothPageIndicator(
                  controller: pgcontroller,
                  count: 50,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Colors.blue,
                  ),
                )
                ),
          ],
        ),
      ),
    );
  }
}
