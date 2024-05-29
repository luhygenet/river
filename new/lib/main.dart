// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_project/presentation/screens/admin_screen/adminDetail.dart';
import 'package:flutter_project/presentation/screens/comment_page.dart';
import 'package:flutter_project/presentation/screens/create_post_page.dart';
import 'package:flutter_project/presentation/screens/login.dart';
import 'package:flutter_project/presentation/screens/create_post_page.dart';
import 'presentation/screens/detailpage.dart';
import 'package:flutter_project/presentation/screens/login.dart';
import 'package:flutter_project/presentation/screens/admin_screen/adminDetail.dart';
import 'package:flutter_project/presentation/screens/admin_screen/comment_admin.dart';
import 'package:flutter_project/presentation/screens/noaccount.dart';
import 'package:flutter_project/presentation/screens/profile.dart';
import 'package:flutter_project/presentation/screens/signup.dart';
import 'package:flutter_project/presentation/screens/withaccount.dart';
import 'package:flutter_project/presentation/widgets/nav.dart';

import 'presentation/screens/detailpage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: '/',
        routes: {
          '/noaccount': (context) => NoAccount(),
          '/withaccount': (context) => WithAccount(),
          '/login': (context) => LogInPage(),
          '/signup': (context) => SignUpPage(),
          '/profile': (context) => ProfileTwo(),
          '/detail': (context) => ItemPage(),
          '/add': (context) => LostFoundForm(),
          '/comment': (context) => CommentPage(),
          '/home': (context) => HomeScreen()
        },
        home: NoAccount());
  }
}
