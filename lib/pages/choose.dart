import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time/services/worldtime.dart';
import 'package:intl/intl.dart';


class Chooselocation extends StatefulWidget {
  const Chooselocation({Key? key}) : super(key: key);

  @override
  _ChooselocationState createState() => _ChooselocationState();
}

class _ChooselocationState extends State<Chooselocation> {
  List<WorldTime> location = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];


  void updatetime() async {
    WorldTime instance2 = WorldTime(

        location: toBeginningOfSentenceCase(controller.text) ?? "",
        flag: 'usa.png',
        url: '$continent/${controller.text}');
    await instance2.GetData();
    Navigator.pop(context, {
      'location': instance2.location,
      'time': instance2.timenow,
      'flag': instance2.flag
    });
  }

  TextEditingController controller = TextEditingController();
  String value1 = " ";
  String continent = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text(
          "Choose Location",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.amber,
        centerTitle: true,
        elevation: 3.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: "Enter City",
                    labelText: "City",
                    labelStyle: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                    ),
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    filled: true,
                  )),
              SizedBox(height: 15.0,),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 180.0, 0),
                child: Container(
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Enter Continent:",
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.amber
                    ),
                    ),
                  ),
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  Radio(
                    value: 'Europe', onChanged: (value) {
                      setState(() {
                        value1 = 'Europe';
                        continent = "Europe";
                      }); }, groupValue: value1,
                  ),
                  Text("Europe",
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                  )
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 'Africa', onChanged: (value) { setState(() {
                    value1 = 'Africa';
                    continent = "Africa";
                    }); }, groupValue: value1,
                  ),
                  Text("Africa",
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 'Asia', onChanged: (value) { setState(() {
                    value1 = 'Asia';
                    continent = "Asia";
                    }); }, groupValue: value1,
                  ),
                  const Text("Asia",
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 'Australia', onChanged: (value) { setState(() {
                    value1 = 'Australia';
                    }); }, groupValue: value1,
                  ),
                  Text("Australia",
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  )
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                ),
                  child: const Text("Show",
                  style: TextStyle(
                    color: Colors.amber
                  ),
                  ),
                  onPressed: () {
                updatetime();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
