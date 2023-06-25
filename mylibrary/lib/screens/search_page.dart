import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mylibrary/api/apiget.dart';
import 'package:mylibrary/methods/firebasemethods.dart';
import 'package:mylibrary/ui/uicolors.dart';

class SearchList extends StatelessWidget {
  final List<BookData> books;
  final User? user;
  final String searchvalue;
  final Function setstate;
  const SearchList({Key? key, required this.books,required this.user,required this.setstate,required this.searchvalue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: bgcolor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Text("Search Results for "+searchvalue,style: Theme.of(context).textTheme.headlineMedium,),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    var author = "";
                    for (var i = 0; i < books[index].authors!.length; i++) {
                      author += books[index].authors![i];
                      if (i != books[index].authors!.length - 1) {
                        author += ", ";
                      }
                    }
                    return ListTile(
                      leading: Image.network(books[index].imageUrl),
                      title: Text(books[index].title),
                      subtitle: Text(author),
                      trailing: IconButton(
                        onPressed: () {
                          addbookToUser(user!.uid,books[index]);
                          setstate();
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.add_circle,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
