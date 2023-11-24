import 'package:flutter/material.dart';
import 'package:practice2/rest_api/practice/user_api_screen.dart';

//Future<void>
void main() =>
    // WidgetsFlutterBinding.ensureInitialized();
    // final prefs = await SharedPreferences.getInstance();
    // final showHome = prefs.getBool('showHome') ?? false;
    runApp(MyApp()); //showHome: showHome

// void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
    // required bool showHome,
    //required bool showHome
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //get showHome => showHome;

  @override
  Widget build(BuildContext context) {
    return
        //MultiProvider(
        // providers: [],
        // child:
        const MaterialApp(
      //   //home: ExampleFour(),
      home: UserApiScreen(),
      // home: PracApiScreen(),
    );
  }
}
//   home: showHome
//       ? OnBoard()
//       : Container(
//           child: Text('HOME'),
//         ),
// ),
// providers: [
//   //ChangeNotifierProvider(create: (context) => NumbersListProvider()),
//   ChangeNotifierProvider(create: (context) => MovieProvider()),
// ]
//
// class DemoApp extends StatefulWidget {
//   const DemoApp({super.key});
//
//   @override
//   State<DemoApp> createState() => _DemoAppState();
// }
//
// class _DemoAppState extends State<DemoApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Demo App")),
//       body: Center(
//         child: GestureDetector(
//           onDoubleTap: () {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (content) => HomePage()));
//           },
//           child: GridView(
//             scrollDirection: Axis.vertical,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               mainAxisSpacing: 10,
//               crossAxisSpacing: 20,
//               //  childAspectRatio: 5,
//             ),
//             children: [
//               Image.network(
//                   'https://images.unsplash.com/photo-1506012787146-f92b2d7d6d96?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YWlycGxhbmUlMjB2aWV3fGVufDB8fDB8fHww&w=1000&q=80'),
//               Image.network(
//                   'https://images.unsplash.com/photo-1539612793508-4539a972242b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cGxhbmUlMjBjbG91ZHMlMjBza3l8ZW58MHx8MHx8fDA%3D&w=1000&q=80'),
//               Image.network(
//                   'https://images.unsplash.com/photo-1539612793508-4539a972242b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cGxhbmUlMjBjbG91ZHMlMjBza3l8ZW58MHx8MHx8fDA%3D&w=1000&q=80'),
//               Image.network(
//                   'https://images.unsplash.com/photo-1506012787146-f92b2d7d6d96?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YWlycGxhbmUlMjB2aWV3fGVufDB8fDB8fHww&w=1000&q=80'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Access the screen information using MediaQuery
//     //final mediaQuery = MediaQuery.of(context);
//     // Define different text based on screen width
//     // final textToShow =
//     //     mediaQuery.size.width < 600 ? 'Small Screen' : 'Large Screen';
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.teal,
//         ),
//         body: Center(
//           child: Column(
//             children: [
//               SizedBox(height: 25),
//               Container(
//                 color: Colors.teal,
//                 child: Padding(
//                   padding: EdgeInsets.all(30),
//                   child: Text('First line', style: TextStyle(fontSize: 25)),
//                 ),
//               ),
//               SizedBox(height: 5),
//               Container(
//                 color: Colors.teal,
//                 child: Padding(
//                   padding: EdgeInsets.only(right: 100, bottom: 15),
//                   child: Text('Second line', style: TextStyle(fontSize: 25)),
//                 ),
//               ),
//               SizedBox(height: 5),
//               Container(
//                 color: Colors.teal,
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
//                   child: Text('Third line', style: TextStyle(fontSize: 25)),
//                 ),
//               ),
//             ],
//           ),
//         ), //Center
//       ), //Scaffold
//     ); //MaterialApp
//   }
// }
