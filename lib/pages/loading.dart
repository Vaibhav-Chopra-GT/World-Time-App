import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:world_time/services/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Load extends StatefulWidget {
  const Load({Key? key}) : super(key: key);

  @override
  _LoadState createState() => _LoadState();
}

class _LoadState extends State<Load> {
  void GetWorldTime() async {
    WorldTime instance =
        WorldTime(location: 'Berlin', flag: 'berlin.jpg', url: 'Europe/Berlin');
    await instance.GetData();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'time': instance.timenow,
      'flag': instance.flag
    });
  }

  @override
  void initState() {
    super.initState();
    GetWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: SpinKitSpinningLines(
          color: Colors.white,
          size: 50.0,
        )));
  }
}
