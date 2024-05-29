// import 'package:flutter/material.dart';

// class NewPost extends StatefulWidget {
//   @override
//   State<NewPost> createState() => _NewPostState();
// }

// class _NewPostState extends State<NewPost> {
//   List<String> images = ["Assets/post.png"];
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Expanded(
//               child: Container(
//                 color: const Color.fromARGB(179, 3, 168, 244),
//                 child: Padding(
//                   padding: EdgeInsets.all(60),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(30),
//                           color: Colors.white,
//                         ),
//                         width: 130,
//                         height: 130,
//                         child: Center(
//                           child: Image.asset(
//                             images[0],
//                             width: 100,
//                             height: 100,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       ElevatedButton(
//                           onPressed: () {}, child: const Text("Select image")),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Expanded(
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15),
//                             color: Colors.white,
//                             border:
//                                 Border.all(color: Colors.black),
//                           ),
//                           width: 300,
//                           padding: EdgeInsets.all(10),
//                           child: SingleChildScrollView(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   width: double.infinity,
//                                   child: const Text(
//                                     "Description",
//                                     textAlign: TextAlign.center,
//                                     style:
//                                         TextStyle(fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                                 TextFormField(
//                                   decoration: const InputDecoration(
//                                     labelText: "Description",
//                                     labelStyle:
//                                         TextStyle(fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 10),
//                                 const SizedBox(
//                                   width: double.infinity,
//                                   child: Text(
//                                     "Location",
//                                     textAlign: TextAlign.center,
//                                     style:
//                                         TextStyle(fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                                 TextFormField(
//                                   decoration: const InputDecoration(
//                                     labelText: "location",
//                                     labelStyle:
//                                         TextStyle(fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 10),
//                                 const SizedBox(
//                                   width: double.infinity,
//                                   child: Text(
//                                     "Time",
//                                     textAlign: TextAlign.center,
//                                     style:
//                                         TextStyle(fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                                 TextFormField(
//                                   decoration: const InputDecoration(
//                                     labelText: "Time",
//                                     labelStyle:
//                                         TextStyle(fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
