import 'package:flutter/material.dart';

class ListModalities extends StatefulWidget {
  @override
  _ListModalitiesState createState() => _ListModalitiesState();
}

class _ListModalitiesState extends State<ListModalities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modalidades"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
