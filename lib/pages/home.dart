import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};

  @override
  Widget build(BuildContext context) {

    data=data.isNotEmpty? data:ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    // set bg

    String image=data['isDaytime'] ? "https://t3.ftcdn.net/jpg/02/59/42/54/360_F_259425456_nuW385z4eGarWkyeSs0aLcvgB2vP7yul.jpg" : "https://images.unsplash.com/photo-1509773896068-7fd415d91e2e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bmlnaHQlMjB0aW1lfGVufDB8fDB8fA%3D%3D&w=1000&q=80";

    return Scaffold(
      //backgroundColor: Colors.green,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120,0,0),
            child: Column(
              children: [
                TextButton.icon(
                    onPressed: () async{
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data={
                          'time':result['time'],
                          'location':result['location'],
                        'isDaytime':result['isDaytime'],
                          'flag':result['flag']
                        };
                      });
                    }, icon: Icon(Icons.edit_location,color: Colors.black,), label: Text("Edit location",style: TextStyle(color: Colors.black),),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(data['location'],style: TextStyle(fontSize: 28, letterSpacing: 2.0),),
                   ],
                ),
                SizedBox(height: 20,),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
