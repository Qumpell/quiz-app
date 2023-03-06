import 'package:flutter/material.dart';

import 'column.dart';

void main() => runApp(MyApp());

//void main(){
//runApp(MyApp())
//}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Quiz app',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        // useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      // A widget which will be started on application startup
      home: const MyHomePage(title: 'Quiz app'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // The title text which will be shown on the action bar
          title: Text(title),
        ),
        // body: Center(
        //   child: Text(
        //     'Hello, World!',
        //   ),
        // ),
        body: Center(child: QuestionWidget()));

    //body: QuestionWidget());
  }
}
