import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
final phone='8077485551';
final Uri _url = Uri(scheme: 'tel',path:phone);
final Uri _url1 = Uri.parse('https://linkedin.com/in/arpit-v-1a4205220');

final Uri _url2 = Uri.parse('https://github.com/arpitvermaofficial');
    final Uri _url3 = Uri.parse('https://developers.google.com/profile/u/102728849976140432195');
final Uri params = Uri(
    scheme: 'mailto',
    path: 'arpitv747@gmail.com',
    queryParameters: {
      'subject': "hello arpit verma i loves your app",

    }
);
class File extends StatefulWidget {
  const File({Key? key}) : super(key: key);

  @override
  State<File> createState() => _FileState();
}

class _FileState extends State<File> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
      color:Colors.blueGrey,
      child:Column(
        children: [
          SizedBox(
            height:MediaQuery.of(context).size.height*0.037,
          ),
          CircleAvatar(

          backgroundColor:Colors.black,
          radius: 67.0,

          child:CircleAvatar(
            radius:65.0,
            foregroundColor:Colors.white,
            backgroundColor:Colors.white,
            child: CircleAvatar(
              radius: 63.0,
              foregroundImage:AssetImage('assets/arpit.png'),
              child:CircleAvatar(
                radius: 61.0,
                backgroundColor:Colors.black,
              ),
            ),

          ),
        ),
          Text(
            //Text:
            "Arpit Verma",
            style:TextStyle(
                decoration:TextDecoration.none,
                fontFamily:'Pacifico',
                color:Colors.white,
fontSize: 38,
                shadows:[
                  Shadow(
                    blurRadius:10.0,
                    offset:Offset(5.0,5.0),
                  )
                ]
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text("Flutter developer",
            style:TextStyle(
fontSize: 33,
                decoration:TextDecoration.none,
                fontFamily:'HiMelody',
                color:Colors.white,
                shadows:[
                  Shadow(
                      blurRadius:10.0,
                      offset:Offset(5.0,5.0)
                  )
                ]
            ),
          ),
          Text(
            "Rajkiya Engineering College",

            style:TextStyle(
              fontSize: 33,
                fontFamily:'HiMelody',
                decoration:TextDecoration.none,

                color:Colors.white, shadows:[
              Shadow(
                  blurRadius:10.0,
                  offset:Offset(5.0,5.0)
              )
            ]
            ),
            textAlign:TextAlign.center,
          ),

          Card(
            color:Colors.white,
            margin:EdgeInsets.symmetric(
              vertical:10.0,
              horizontal:25.0,
            ),
            child:ListTile(
              onTap: ()async{

                if(await canLaunchUrl(_url1)){
                  await launchUrl(_url1);
                }
              },

              leading:Icon(FontAwesomeIcons.linkedin,
                  size:30.0,color: Colors.blue,),

              title:Text(
                "Linkedin Profile",

                style:TextStyle(
                  color:Colors.lightBlue,
                  fontFamily:'HiMelody',
                  fontSize:23.0,
                  fontWeight:FontWeight.w300,
                ),
              ),
            ),),
          Card(
            color:Colors.white,
            margin:EdgeInsets.symmetric(
              vertical:10.0,
              horizontal:25.0,
            ),
            child:ListTile(
              onTap: ()async{

                if(await canLaunchUrl(params)){
                  await launchUrl(params);
                }
              },

              leading:Icon(FontAwesomeIcons.envelope,
                size:30.0,color: Colors.black,),

              title:Text(
                "arpitv747@gmail.com",

                style:TextStyle(
                  color:Colors.lightBlue,
                  fontFamily:'HiMelody',
                  fontSize:23.0,
                  fontWeight:FontWeight.w300,
                ),
              ),
            ),),
          Card(
            color:Colors.white,
            margin:EdgeInsets.symmetric(
              vertical:10.0,
              horizontal:25.0,
            ),
            child:ListTile(
              onTap: ()async{

                if(await canLaunchUrl(_url2)){
                  await launchUrl(_url2);
                }
              },

              leading:Icon(FontAwesomeIcons.github,
                  size:30.0,
              color: Colors.black,),

              title:Text(
                "Github",

                style:TextStyle(
                  color:Colors.lightBlue,
                  fontFamily:'HiMelody',
                  fontSize:23.0,
                  fontWeight:FontWeight.w300,
                ),
              ),
            ),),
          Card(
            color:Colors.white,
            margin:EdgeInsets.symmetric(
              vertical:10.0,
              horizontal:25.0,
            ),
            child:ListTile(
              onTap: ()async{

                if(await canLaunchUrl(_url3)){
                  await launchUrl(_url3);
                }
              },

              leading:Icon(FontAwesomeIcons.google,
                  size: 30,color: Colors.black,),

              title:Text(
                "Goggle Developer Profile",

                style:TextStyle(
                  color:Colors.lightBlue,
                  fontFamily:'HiMelody',
                  fontSize:23.0,
                  fontWeight:FontWeight.w300,
                ),
              ),
            ),),
          Card(
            color:Colors.white,
            margin:EdgeInsets.symmetric(
              vertical:10.0,
              horizontal:25.0,
            ),
            child:ListTile(
              onTap: ()async{

                if(await canLaunchUrl(_url)){
                  await launchUrl(_url);
                }
              },
              leading:Icon(FontAwesomeIcons.phone,
                size:30.0,),
              iconColor:Colors.green,
              title:Text("8077485551",
                style:TextStyle(
                  fontFamily:'HiMelody',
                  color:Colors.lightBlue,
                  fontSize:23.0,
                  fontWeight:FontWeight.w300,
                  //shadows:[
                  //Shadow(
                  //blurRadius:10.0,
                  // offset:Offset(5.0,5.0)
                  //)
                  //]
                ),),
            ),
          )],
      ),
      )
    );

  }
}
