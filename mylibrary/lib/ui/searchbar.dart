import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mylibrary/api/apiget.dart';
import 'package:mylibrary/screens/search_page.dart';

class SearchBarWidget extends StatefulWidget {
  final User? user;
  final Function statefunc;
  const SearchBarWidget({Key? key,required this.user,required this.statefunc}) : super(key: key);

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  List<BookData> bookslist = [];
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width-40,
      child: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: TextField(
          controller: _controller,
          onSubmitted: (value) async {
            bookslist =
                await APIService().get(_controller.text.replaceAll(" ", "+"));
                
            setState(() {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SearchList(books: bookslist,user: widget.user,setstate: widget.statefunc,searchvalue: _controller.text,),
                ),
              );
              _controller.clear();
            });
          },
          decoration: const InputDecoration(hintText: "Enter book title here",),
        ),
      ),
    );
  }
}
