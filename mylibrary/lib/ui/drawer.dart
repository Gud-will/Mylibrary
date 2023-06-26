import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mylibrary/methods/signin_method.dart';
import 'package:mylibrary/screens/login_page.dart';

class DrawerWidget extends StatelessWidget {
  final User user;
  const DrawerWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(user.displayName!),
            accountEmail: Text(user.email!),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(user.photoURL ??
                  "https://img.freepik.com/free-vector/no-data-concept-illustration_114360-536.jpg?w=740&t=st=1687613434~exp=1687614034~hmac=cf608dbab29481b3843be9d5f54fb4ee631e3f1236e1a301226b70b60279638a"),
            ),
          ),
          Container(
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.blue.shade100))),
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () async {
                await signout();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
