import 'package:better_me_diary/utils/constants.dart';
import 'package:flutter/material.dart';

/*
 * Patrik Schwartz - 4.9.2020
 * IndexPage - loading page which should decide where to go next.
 * 1. All needed data and settings are collected and provided
 * 2. Choose next Page
 *    a.  If the user is logged in, he is sent to the HomePage
 *    b.  Else the usee is redirected to the LoginPage
*/

class IndexPage extends StatefulWidget {
  
  const IndexPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryWhiteColor,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text(
          "Better Me Diary",
          style: TextStyle(
            fontSize: h4Heading,
            color: primaryBrownColor,
          ),
        ),
      ),
    );
  }
}