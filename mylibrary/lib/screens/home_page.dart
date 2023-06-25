import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mylibrary/api/apiget.dart';
import 'package:mylibrary/methods/firebasemethods.dart';
import 'package:mylibrary/ui/appbar.dart';
import 'package:mylibrary/ui/bookcard.dart';
import 'package:mylibrary/ui/drawer.dart';
import 'package:mylibrary/ui/searchbar.dart';
import 'package:mylibrary/ui/uicolors.dart';

class MyHomePage extends StatefulWidget {
  final User? user;
  const MyHomePage({Key? key, required this.user}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FocusNode searchbar = FocusNode();
  void changestate() {
    setState(() {});
  }

  Future<List<BookData>> getbookdetails(List<dynamic> doc) async {
    List<BookData> bookslist = [];
    List<String> bookids = doc.map((item) => item as String).toList();
    for (var i = 0; i < bookids.length; i++) {
      bookslist.add(await getbook(bookids[i]));
    }
    return bookslist;
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        drawer: DrawerWidget(user: widget.user!),
        appBar: appbarwidget(_scaffoldKey, widget.user!),
        backgroundColor: Colors.transparent,
        body: Container(
          padding: const EdgeInsets.only(top:50, left: 10, right: 10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: bgcolor,
          child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection("Users")
                  .doc(widget.user!.uid)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                      snapshot) {
                if (snapshot.hasData && !snapshot.hasError) {
                  return FutureBuilder(
                    future: getbookdetails(snapshot.data!['books']),
                    builder: (context, futuresnap) {
                      if (futuresnap.hasData && !futuresnap.hasError) {
                        List<BookData> bookslist =
                            (futuresnap.data as List<BookData>);
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SearchBarWidget(
                              user: widget.user,
                              statefunc: changestate,
                            ),
                            CarouselSlider.builder(
                              itemCount: bookslist.length,
                              itemBuilder: (context, index, page) {
                                return BookCard(book: bookslist[index]);
                              },
                              options: carouselOptions,
                            ),
                          ],
                        );
                      } else if (futuresnap.hasError) {
                        debugPrint("error" + snapshot.error.toString());
                        return const Text(
                            "Error in Loading data from fireStore in future");
                      } else {
                        return const SizedBox(
                          child: Center(child: CircularProgressIndicator()),
                          height: 200.0,
                          width: 200.0,
                        );
                      }
                    },
                  );
                } else if (snapshot.hasError) {
                  debugPrint("error" + snapshot.error.toString());
                  return const Center(
                    child: Text(
                        "Error in Loading data from fireStore in streambuilder"),
                  );
                } else {
                  return const SizedBox(
                    child: Center(child: CircularProgressIndicator()),
                    height: 200.0,
                    width: 200.0,
                  );
                }
              }),
        ),
      ),
    );
  }
}
