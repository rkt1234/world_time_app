import 'package:flutter/material.dart';

import '../services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'https://cdn.britannica.com/25/4825-004-F1975B92/Flag-United-Kingdom.jpg'),
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Greece.svg/2560px-Flag_of_Greece.svg.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'https://cdn.britannica.com/85/185-004-1EA59040/Flag-Egypt.jpg'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'https://cdn.britannica.com/15/15-004-B5D6BF80/Flag-Kenya.jpg'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/1200px-Flag_of_the_United_States.svg.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/1200px-Flag_of_the_United_States.svg.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'https://cdn.britannica.com/49/1949-050-39ED83BA/Flag-South-Korea.jpg'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'https://cdn.britannica.com/48/1648-004-A33B72D8/Flag-Indonesia.jpg'),
  ];

  void updateTime(index) async
  {
   WorldTime instance=locations[index];
   await instance.getTime();
   // navigate to Home Screen
    Navigator.pop(context , {
      'location':instance.location,
      'flag': instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length, itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(locations[index].flag),
                ),
              ),
            ),
          );
      },
      ),
    );
  }
}
