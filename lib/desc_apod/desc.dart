import 'package:apod_nasa/model/apod.dart';
import 'package:flutter/material.dart';

class DescViewer extends StatefulWidget {
  final APOD apod;
  DescViewer({this.apod});

  @override
  _DescViewerState createState() => _DescViewerState();
}

class _DescViewerState extends State<DescViewer> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(20),
        // width: 200,
        height: 500,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                widget.apod.title,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "©" + widget.apod.copyright,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                widget.apod.description,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
