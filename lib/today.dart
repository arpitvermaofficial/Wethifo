import 'dart:ui';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';


import 'package:wethifo/geo.dart';

import 'package:wethifo/wetherdata.dart';
import 'package:intl/intl.dart';


var dayinfo=DateTime.now();
var dateformat=DateFormat('EEE,d MMM,yyyy').format(dayinfo);
class Today extends StatefulWidget {
  const Today({Key? key}) : super(key: key);

  @override
  State<Today> createState() => _TodayState();
}

class _TodayState extends State<Today> {
  void initState() {

    super.initState();
    audioPlayer.open(Audio('assets/rain.mp3'),autoStart: false,showNotification: true);
  }
  TextEditingController searchcontroller=TextEditingController();
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  bool isAnimated = false;
  var client = weatherdata();
  var data;
  info() async {
    var position = await Getposition();
    data = await client.getData(position.latitude, position.longitude);
    return data;
  }


  final condition1 = [
    "Precipitation",
    "Gust",
    "Uv",
    "Wind",
    "Pressure",
    "Wind Direction",
        "Last Update",


  ];

  int index1 = 0;

  int textindex = 1;
  bool _iconbool = false;
  IconData _iconlight = Icons.sunny;
  IconData _icondarkt = Icons.nights_stay;
  ThemeData _lighttheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
  );
  ThemeData _darktheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
  );
  Color color1 = Colors.black;
  Color color2 = Colors.blue;
DateTime timebackpressed=DateTime.now();

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;

    final String url = "${data?.condition}";


    void AnimateIcon() {
      setState(() {
        isAnimated = !isAnimated;
        if (isAnimated) {
          audioPlayer.play();
          isAnimated = false;
        }
      });
    }
    if (url.contains('rain')) {
      if (url.contains('rain')) {
        setState(() {
          audioPlayer.open(Audio('assets/lightrain.mp3'));
        });
        AnimateIcon();
      } else {
        setState(() {
          audioPlayer.open(Audio('assets/heavy.mp3'));
        });
        AnimateIcon();
      }
    }
    else if (url.contains('cloudy')) {
      if (url.contains('Partly')) {
        setState(() {
          audioPlayer.open(Audio('assets/partialycloudy.mp3'));
        });
        AnimateIcon();
      }
      else {
        setState(() {
          audioPlayer.open(Audio('assets/cloudy.mp3'));
        });
        AnimateIcon();
      }
    }
    else if (url.contains('sunny')) {
      setState(() {
        audioPlayer.open(Audio('assets/sunny.mp3'));
      });
      AnimateIcon();
    }
    else if (url.contains('fog')) {
      setState(() {
        audioPlayer.open(Audio('assets/fog.mp3'));
      });
      AnimateIcon();
    } else if (url.contains('thunderstom')) {
      setState(() {
        audioPlayer.open(Audio('assets/thuderstorms.mp3'));
      });
      AnimateIcon();
    }
    else if (url.contains('sandstorm')) {
      setState(() {
        audioPlayer.open(Audio('assets/sanstorms.mp3'));
      });
      AnimateIcon();
    }
    else if (url.contains('Clear')) {
      setState(() {
        audioPlayer.open(Audio('assets/clear.mp3'));
      });
      AnimateIcon();
    }
    else {
      setState(() {
        audioPlayer.open(Audio('assets/else.mp3'));
      });
      AnimateIcon();
    }
    return

    Scaffold(
        backgroundColor: _iconbool ? color1 : color2,
        body: FutureBuilder(
            future: info(),
            builder: (context, snapshot) {
              return Container(
                  color: Colors.black,
                  child: Column(
                    children: [
                      Container(
                        height: size.height * 0.48,
                        width: size.width,
                        padding: EdgeInsets.only(top: 30),
                        margin: EdgeInsets.only(right: 10, left: 10),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              colors: [Colors.blue, Colors.purpleAccent],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0.3, 0.8],

                            )
                        ),
                        child: Column(

                            children: [
                              Column(children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Text('${data?.city}',
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(dateformat,
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),)
                              ]),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                  children: [
                                    Expanded(child: Container(
                                      child:
                                      Column(
                                          children: [
                                            ClipRRect(

                                                borderRadius: BorderRadius
                                                    .circular(15),
                                                child: BackdropFilter(
                                                  filter: ImageFilter
                                                      .blur(
                                                      sigmaX: 15,
                                                      sigmaY: 15),
                                                  child:
                                                  Container(
                                                    width: size.width *
                                                        0.4,
                                                    height: size.height *
                                                        0.25,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(
                                                          0.3),
                                                      borderRadius: BorderRadius
                                                          .circular(15),
                                                      border: Border.all(
                                                          width: 2,
                                                          color: Colors
                                                              .white30),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Image.network(
                                                          'https:${data
                                                              ?.icon}',
                                                          width: size
                                                              .width *
                                                              0.35,
                                                          fit: BoxFit
                                                              .fill,),
                                                        Text(
                                                            '${data
                                                                ?.condition}',
                                                            style: TextStyle(
                                                              fontSize: 22,
                                                              fontWeight: FontWeight
                                                                  .bold,
                                                              color: Colors
                                                                  .white,
                                                            )
                                                        ),


                                                      ],
                                                    ),
                                                  ),
                                                )
                                            ),
                                          ]
                                      ),)
                                    ),

                                    Expanded(child: Container(
                                      child:
                                      Column(
                                          children: [
                                            ClipRRect(
                                                borderRadius: BorderRadius
                                                    .circular(15),
                                                child: BackdropFilter(
                                                  filter: ImageFilter
                                                      .blur(
                                                      sigmaX: 15,
                                                      sigmaY: 15),
                                                  child:
                                                  Container(
                                                    width: size.width *
                                                        0.4,
                                                    height: size.height *
                                                        0.25,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(
                                                          0.3),
                                                      borderRadius: BorderRadius
                                                          .circular(15),
                                                      border: Border.all(
                                                          width: 2,
                                                          color: Colors
                                                              .white30),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 30,
                                                        ),
                                                        Text("Temp°C",
                                                          style: TextStyle(
                                                            fontSize: 35,
                                                            fontWeight: FontWeight
                                                                .bold,
                                                            color: Colors
                                                                .white,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 25,
                                                        ),
                                                        Text(
                                                          '${data?.tem}',
                                                          style: TextStyle(
                                                            fontSize: 38,
                                                            fontWeight: FontWeight
                                                                .bold,
                                                            color: Colors
                                                                .white,
                                                          ),),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                            ),
                                          ]
                                      ),)
                                    ),
                                  ])
                            ]
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      SizedBox(

                        height: 180,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return buildcard(index, data);
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(width: 35);
                            },
                            itemCount: 7),

                      )

                    ],
                  )
              );
            }
        )

    );

  }


  Widget buildcard(int index,var data)=>Container(
    padding: EdgeInsets.only(left: 15),
    child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius
                  .circular(15),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 15, sigmaY: 15),
                child:
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.4,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.white
                        .withOpacity(0.3),
                    borderRadius: BorderRadius
                        .circular(15),
                    border: Border.all(
                        width: 2,
                        color: Colors
                            .white30),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 7,
                      ),
                     SizedBox(
                       height: 65,
                       width: 80,
                       child: Image.asset(index==0?"assets/precip.png"
                          :index==1?"assets/gust.png"
                          :index==2?"assets/uv.png"
                          :index==3?"assets/wind.png"
                          :index==4?"assets/pressure.png"
                          :index==5?"assets/blow.png"
                          :"assets/last.png"

                    ),),
                      Text(condition1[index],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight
                              .bold,
                          color: Colors.white,
                        ),
                      ),
                      Column(children: [
                        Text(index==0?data==null?"":"${data?.picip}mm"
                            :index==1?data==null?"":"${data?.gust}kph"
                            :index==2?data==null?"":"${data?.uv}"
                            :index==3?data==null?"":"${data?.wind}kph"
                            :index==4?data==null?"":"${data?.pressure}mb"
                            :index==5?data==null?"":"${data?.winddir}"
                            :data==null?"":"${data?.lastupdate}"
                         ,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight
                                .bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                      )

                    ],
                  ),
                ),
              )
          ),
        ]
    ),
  );

}