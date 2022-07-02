import 'dart:ui';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:wethifo/geo.dart';
import 'package:wethifo/wetherdata.dart';
import 'package:intl/intl.dart';

var dayinfo=DateTime.now();
var dateformat=DateFormat('EEE,d MMM,yyyy').format(dayinfo);
class Weakly extends StatefulWidget {
  const Weakly({Key? key}) : super(key: key);

  @override
  State<Weakly> createState() => _WeaklyState();
}

class _WeaklyState extends State<Weakly> {

  TextEditingController searchcontroller=TextEditingController();
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  bool isAnimated = false;
  void initState() {
    super.initState();
    audioPlayer.open(Audio('assets/dolphin.mp3'),autoStart: false,showNotification: true);
  }
  var client = weatherdata();



  final condition1 = [
    "Feel like",
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;


    var client = weatherdata();
    var data;
    info() async {
      var position = await Getposition();
      data = await client.getData(position.latitude, position.longitude);
      return data;
    }
    final String url="${data?.condition}";

    return
      Scaffold(
          backgroundColor: _iconbool ? color1 : color2,
          body: FutureBuilder(
              future: info(),
              builder: (context, snapshot) {
                return Container(
                    color: Colors.black,
                    child: Column(

                            children:[
                              Padding(padding: EdgeInsets.only(top: 150,left: 50,right: 50,)),
                              SizedBox(

                                  height: 400,
                                  child: ListWheelScrollView(

                                    itemExtent: 200,
                                    physics: FixedExtentScrollPhysics(),
                                    squeeze: 1.2,
                                    perspective: 0.008,
                                    children: [
                                      buildcard(0, data),

                                      buildcard(1, data),
                                      buildcard(2, data),
                                      buildcard(4, data),
                                      buildcard(5, data),
                                      buildcard(6, data),
                                      buildcard(7, data),

                                    ],


                                  )
                              )]


                    
                )
                );
              }
          )
      );

  }
  void AnimateIcon() {
    setState(() {
      isAnimated = !isAnimated;
      if(isAnimated)
      {
        audioPlayer.play();
        isAnimated = false;
      }

    });
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
                        child:  Image.asset(index==0?"assets/tem.png"
                        :index==1?"assets/precip.png"
                            :index==2?"assets/gust.png"
                            :index==3?"assets/uv.png"
                            :index==4?"assets/wind.png"
                            :index==5?"assets/pressure.png"
                            :index==6?"assets/blow.png"
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
                        Text(index==0?"${data?.tem}°C"
                          :index==1?"${data?.picip}mm"
                            :index==2?"${data?.gust}kph"
                            :index==3?"${data?.uv}"
                            :index==4?"${data?.wind}kph"
                            :index==5?"${data?.pressure}mb"
                            :index==6?"${data?.winddir}"

                            :"${data?.lastupdate}"
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