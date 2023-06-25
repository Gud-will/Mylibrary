import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mylibrary/api/apiget.dart';
import 'package:mylibrary/methods/firebasemethods.dart';
import 'package:mylibrary/ui/bookcard.dart';
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

  Future<List<BookData>> getbookdetails(
      List<dynamic> doc) async {
    List<BookData> bookslist = [];
    List<String> bookids = doc.map((item) => item as String ).toList();
    for (var i = 0; i < bookids.length; i++) {
      bookslist.add(await getbook(bookids[i]));
    }
    return bookslist;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.user!.photoURL ?? ""),
            ),
          ),
          title: Text(widget.user!.displayName ?? ""),
        ),
        backgroundColor: Colors.transparent,
        body: Container(
          padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: bgcolor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Hero(
                tag: "searchBar",
                child: SearchBarWidget(
                  user: widget.user,
                  statefunc: changestate,
                ),
              ),
              StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection("Users")
                      .doc(widget.user!.uid).snapshots(),
                  //future: getuserbooks(widget.user!.uid),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
                    if (snapshot.hasData && !snapshot.hasError) {
                      debugPrint("snapppppp"+snapshot.data!['books'].toString());
                      // debugPrint("snapshot.data" +
                      //     (snapshot.data as List<BookData>).toString());
                      return FutureBuilder(
                        future: getbookdetails(snapshot.data!['books']),
                        builder: (context, futuresnap) {
                          if (futuresnap.hasData && !futuresnap.hasError) {
                            List<BookData> bookslist =
                          (futuresnap.data as List<BookData>);
                            return CarouselSlider.builder(
                              itemCount:
                                  bookslist.length,
                              itemBuilder: (context, index, page) {
                                return BookCard(book: bookslist[index]);
                              },
                              options: CarouselOptions(
                                height: 600,
                                enlargeCenterPage: true,
                                aspectRatio: 16 / 9,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enableInfiniteScroll: true,
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 800),
                                viewportFraction: 0.9,
                              ),
                            );
                          } else if (futuresnap.hasError) {
                            debugPrint("error" + snapshot.error.toString());
                            return const Text(
                                "Error in Loading data from fireStore in future");
                          } else {
                            return const CircularProgressIndicator();
                          }
                        },
                      );
                    } else if (snapshot.hasError) {
                      debugPrint("error" + snapshot.error.toString());
                      return const Text("Error in Loading data from fireStore in streambuilder");
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
