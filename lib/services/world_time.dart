import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  final String location;
  late String time;
  final String flag;
  final String url;
  late bool isDayTime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async{
    try{
      final response = await http.get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      if(response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        String datetime = data['datetime'];
        String offset = data['utc_offset'];
        int offsetHours = int.parse(offset.substring(1, 3));
        if (offset[0] == '-') {
          offsetHours = -offsetHours;
        }
        DateTime now = DateTime.parse(datetime);
        now = now.add(Duration(hours: offsetHours));
        isDayTime = now.hour >= 6 && now.hour <= 19 ? true : false;
        time = DateFormat.jm().format(now);
      } else {
        throw 'Failed to get time';
      }
    }
    catch(e){
      print('Error caught: $e');
      time = 'Could not get data';
    }
  }
}
