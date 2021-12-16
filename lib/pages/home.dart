import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data = data.isNotEmpty
        ? data
        : ModalRoute
        .of(context)!
        .settings
        .arguments as Map;
    return Scaffold(
        backgroundColor: Colors.amber,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 100.0, 0, 0.0),
          child: SafeArea(
              child: Column(children: <Widget>[
                FlatButton.icon(
                    onPressed: () async {
                      dynamic result =
                      await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                        };
                      });
                    },
                    icon: const Icon(Icons.edit_location),
                    label: const Text("Edit location")),
                const SizedBox(height: 10.0),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(data['location'],
                          style: const TextStyle(
                            fontSize: 50.0,
                          )),
                    ]),
                const SizedBox(height: 50.0),
                Text(data['time'],
                    style: const TextStyle(
                      fontSize: 80.0,
                    ))
              ])),
        ));
  }
}
