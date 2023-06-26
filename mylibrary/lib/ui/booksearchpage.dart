// import 'package:flutter/material.dart';
// import 'package:mylibrary/api/apiget.dart';

// class SearchResultsPage extends StatefulWidget {
//   const SearchResultsPage({Key? key}) : super(key: key);

//   @override
//   State<SearchResultsPage> createState() => _SearchResultsPageState();
// }

// class _SearchResultsPageState extends State<SearchResultsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: APIService().get(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState != ConnectionState.done) {
//           return const Center(child: CircularProgressIndicator());
//         }
//         if (snapshot.hasError) {
//           return Center(child: Text(snapshot.error.toString()));
//         }
//         if (!snapshot.hasData) {
//           return const Center(child: Text("get() returns null!"));
//         }
//         final data = snapshot.data as dynamic; // cast to MyData
//         return Container(
//           padding: const EdgeInsets.all(10),
//           color: Colors.grey,
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text("Field1"),
//                   Text(data.field1),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text("Field2"),
//                   Text(data.field2),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
