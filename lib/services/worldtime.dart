import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime{
String timenow = "";
String url;
String flag;
String location;
WorldTime({required this.location, required this.flag, required this.url});




Future<void> GetData() async{
  Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
  Map data = jsonDecode(response.body);
  String time = data['datetime'];
  String offset1 = data['utc_offset'].substring(1,3);
  String offset2 = data['utc_offset'].substring(4,6);
  DateTime now = DateTime.parse(time);
  now = now.add(Duration(hours: int.parse(offset1), minutes: int.parse(offset2)));

  timenow = DateFormat.jm().format(now);

}}