import 'dart:async';
import 'dart:convert';

import 'package:apod_nasa/model/apod.dart';
import 'package:dio/dio.dart';

class APODBloc {
  final StreamController _stream = StreamController.broadcast();

  Sink get input => _stream.sink;
  Stream<APOD> get output =>
      _stream.stream.asyncMap((dateSearch) => getAPOD(dateSearch));

  // Example: https://apodapi.herokuapp.com/api/?date=2005-12-24&html_tags=false&image_thumbnail_size=450&absolute_thumbnaill_url=true
  String url(DateTime dateSearch) =>
      "https://apodapi.herokuapp.com/api/?date=$dateSearch&html_tags=false&absolute_thumbnail_url=false&thumbs=true";

  Future<APOD> getAPOD(DateTime date) async {
    Response response = await Dio().get(url(date));
    return APOD.fromJson(response.data);
  }

  Future<APOD> getLatestAPOD() async {
    Response response = await Dio().get("https://apodapi.herokuapp.com/api/");
    return APOD.fromJson(response.data);
  }

  closeStream() {
    _stream.close();
    print("Stream closed");
  }

  // TODO
  // getAPODList() {
  //   API.getAPOD().then((response) {
  //     setState(() {
  //       Iterable lista = json.decode(response.body);
  //       users = lista.map((model) => APOD.fromJson(model)).toList();
  //     });
  //   });
  // }
}
