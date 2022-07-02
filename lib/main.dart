import 'dart:async';
import 'dart:math';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wethifo/forecas.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wethifo/portfolio.dart';

import 'package:wethifo/today.dart';
Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

 await UserSimplePreferences.init();
  runApp(const Myapp());

}
class Myapp extends StatelessWidget {

  const Myapp({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return  MaterialApp(

      debugShowCheckedModeBanner: false,
        home:First());
  }
}
class First extends StatefulWidget {

  const First({Key? key}) : super(key: key);
  @override
  State<First> createState() => _FirstState();
  Widget build(BuildContext context ) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
class _FirstState extends  State<First>{

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds:5), () {

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Second()));

    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      body: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child:Image.asset('assets/home.jpg'),
            ),
            Align(
              heightFactor: 3.0,
              child:Expanded(child: CircularProgressIndicator())
            )
          ]
      ),
    );
  }
}
class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);
  @override
  State<Second> createState() => _SecondState();
  Widget build(BuildContext context ) {
    // TODO: implement build
    throw UnimplementedError();

  }
}
class _SecondState extends State<Second> {
  var singleCheckValue=false;
  bool isChecked = false;
  bool on=false;
void initState(){
  super.initState();
  isChecked=UserSimplePreferences.getusername()??false;
  if(isChecked==true){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Three()));
  }
}
  RestorableBoolN checka=RestorableBoolN(true);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/uio.jpeg"
            ),
          )
      ),
      child:Scaffold(
          backgroundColor: Colors.transparent,
          body:SingleChildScrollView(
            child: Column(
              children: [
                const Align(
                  heightFactor:5.0,
                  alignment: Alignment.center,
                  child:Text("Welcome to Wethifo",
                    style:  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize:30.0,
                      fontFamily:'HiMelody',
                      decoration:TextDecoration.none,
                      color:Colors.black,
                      //shadows:[
                      //Shadow(
                      //  blurRadius:10.0,
                      //offset:Offset(5.0,5.0)),
                      //]
                    ),
                  ),
                ),
                Align(
                  heightFactor:0.0,
                  child:Text("Acuurate weather information provider",
                    style:  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize:25.0,
                      fontFamily:'HiMelody',
                      decoration:TextDecoration.none,
                      color:Colors.black,
                      //shadows:[
                      ///Shadow(
                      //  blurRadius:10.0,
                      //    //offset:Offset(5.0,5.0)
                      // )
                      // ]
                    ),
                  ),
                ),
                Align(
                  heightFactor: 1.2,
                  child:ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child:Padding(padding: EdgeInsets.only(left: 40,right: 40),
                      child:  ClipRRect(child:Image.asset('assets/opening1.jpg'),
                          borderRadius: BorderRadius.only(topRight:Radius.circular(25),bottomLeft:Radius.circular(25) ))

                  ),)
                ),
                Align(
                  alignment:Alignment.bottomCenter,
                  heightFactor: 2.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(value:  singleCheckValue, onChanged:(newValue) {
                        setState(() {
                          singleCheckValue = !singleCheckValue;
                          isChecked=!isChecked;
                        });
                      }),
                      Text('I accept all terms and conditions',
                        style: TextStyle(
                          fontSize:20.0,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
               ElevatedButton(
                        onPressed: () async{
                          if(isChecked!=false){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Three()),
                            );
                            await UserSimplePreferences.setusername(isChecked);
                          }
                        },
                        style:ElevatedButton.styleFrom(
                          primary:Colors.deepPurpleAccent,
                        ),
                        child: Text(
                          "Proceed",
                          style: TextStyle(
                            fontSize:30.0,
                          ),
                        )
                    ),



              ],
            ),
          )
      ),
    );
  }
}
class UserSimplePreferences{
  static late SharedPreferences _preferences;
  static const key1='av';
  static Future init()async=>
      _preferences=await SharedPreferences.getInstance();
  static Future setusername(bool isChecked)async=>
      await _preferences.setBool(key1, isChecked);
  static bool? getusername()=> _preferences.getBool(key1);


}
class Three extends StatefulWidget {
  const Three({Key? key}) : super(key: key);
  @override
  State<Three> createState() => _ThreeState();
  Widget build(BuildContext context ) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
class _ThreeState extends State<Three> {
  double value=2.0;
  bool _iconbool=false;
  IconData _iconlight=Icons.sunny;
  DateTime timebackpressed=DateTime.now();
  IconData _icondarkt=Icons.nights_stay;
  ThemeData _lighttheme=ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
  );
  ThemeData _darktheme=ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
  );
  @override

  var singleCheckValue = false;
  bool isChecked = false;
  bool on = false;
  RestorableBoolN checka = RestorableBoolN(true);
  int pageindex=0;
  final pages=[
    Today(),
    Weakly(),

  ];
  int index=0;

  Map<int, Color> colorCodes = {
    50: Color.fromRGBO(147, 205, 72, .1),
    100: Color.fromRGBO(147, 205, 72, .2),
    200: Color.fromRGBO(147, 205, 72, .3),
    300: Color.fromRGBO(147, 205, 72, .4),
    400: Color.fromRGBO(147, 205, 72, .5),
    500: Color.fromRGBO(147, 205, 72, .6),
    600: Color.fromRGBO(147, 205, 72, .7),
    700: Color.fromRGBO(147, 205, 72, .8),
    800: Color.fromRGBO(147, 205, 72, .9),
    900: Color.fromRGBO(147, 205, 72, 1),
  };
  final items=<Widget>[
    Icon(Icons.account_circle,size: 35,),
    Icon(Icons.access_time,size: 35,),

  ];
  @override
  Widget build(BuildContext context) {
    return
  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _iconbool?_darktheme:_lighttheme,
    home:Scaffold(
    body:
   Stack(
  children: [
  Container(
  decoration: BoxDecoration(
  gradient: LinearGradient(colors:[
      Color.fromRGBO(119, 12, 253, 100),
    Color.fromRGBO(236, 20, 253, 100),
    Color.fromRGBO(33, 164, 253, 100),
    ],
    begin:Alignment.bottomLeft,

    end: Alignment.topRight),
    ),
    ),
    SafeArea(child: Container(
    width: 200,
    padding:EdgeInsets.all(8.0),
    child: Column(
    children:[SizedBox(
      height: MediaQuery.of(context).size.height*0.25,
      width: MediaQuery.of(context).size.width*0.55,
      child:
    DrawerHeader(
      child:Container(
        width: MediaQuery.of(context).size.width*0.3,
decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(15),
  color: Colors.black
),
        child:
      Column(
    children: [
    CircleAvatar(
    radius: 50.0,
    foregroundImage: AssetImage("assets/home.jpg"),
    ),
    SizedBox(height: 5.0),
    Text("Wethifo",
    style: TextStyle(
    color: Colors.white,
    ),
    ),
      Padding(padding: EdgeInsets.only(left: 11),child:Text("Accurate Weather ",
        style: TextStyle(
            color: Colors.white,
            fontSize: 12
        ),
      ), ),

      Padding(padding: EdgeInsets.only(left: 10),child:Text("Information Provider",
        style: TextStyle(
            color: Colors.white,
            fontSize: 12
        ),
      ), )


    ],
    ),)
    ),),
    Expanded(child: ListView(
    children: [
    ListTile(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>File()));
    },
    leading: Icon(Icons.account_circle,
    color: Colors.white,),
    title: Text('About Developer',
    style: TextStyle(
    color: Colors.white,
    ),),
    ),

    ListTile(

    onTap: (){
      setState((){
        _iconbool=!_iconbool;
      });
    },
    leading: Icon(_iconbool?_iconlight:_icondarkt,
    color: Colors.white,),
    title: Text(_iconbool?"Light Mode":"Dark mode",
    style: TextStyle(
    color: Colors.white,
    ),),
    ),
    ],
    ))
    ],
    ),
    )),
    TweenAnimationBuilder(tween: Tween<double>(begin: 0,end: value),
    duration:Duration(milliseconds: 500),
    builder: (_,double val,__){
    return(
    Transform(
    alignment:Alignment.center,
    transform:Matrix4.identity()
    ..setEntry(3, 2, 0.001)
    ..setEntry(0, 3, 200*val)
    ..rotateY(pi/6*val),
    child: Scaffold(
    backgroundColor: Colors.black,

    body: pages[pageindex],
    bottomNavigationBar:Theme(

    data:Theme.of(context).copyWith(iconTheme: IconThemeData(color: Colors.black)) ,
    child:
    CurvedNavigationBar(
    index: 0,
    color: Colors.cyanAccent,
    buttonBackgroundColor: Colors.purpleAccent,
    backgroundColor: Colors.transparent,
    height: 70,
    onTap: (pageindex)=>setState((){
    this.index=index;
    this.pageindex=pageindex;
    }),
    items:items,
    ),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    )
    )
    );
    }
    ),
    GestureDetector(

      onHorizontalDragUpdate: (e){

        if(e.delta.dx>0){
          setState(() {
            value=1;
          });
        }
        else{
          setState(() {
            value=0;
          });
        }
      },
    ),
      ]
      )
    )
  );
  }
}
