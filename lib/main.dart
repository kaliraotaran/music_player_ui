import 'package:flutter/material.dart';
import 'package:music_player_ui/color.dart';
import 'package:music_player_ui/navBar.dart';
import 'package:lottie/lottie.dart';
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyApp(),
    )
    );
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 double  slidervalue =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(children: [
        NavigationsBar(),
        SizedBox(height: 30,),
        AlbumArt(),
        SizedBox(height: 20,),
        Text('Breathe', style: TextStyle( fontWeight: FontWeight.w500, fontSize: 28, color: secondaryColor), ),
         
        Text('Yeat', style: TextStyle( fontWeight: FontWeight.w300, fontSize: 20, color: secondaryColor), ),
        
        SliderTheme(data: SliderThemeData(
          trackHeight: 1, 
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6)), 
          child: Slider(
          value: slidervalue,
          activeColor: secondaryColor,
          inactiveColor: Colors.white,
          onChanged: (value){
            setState(() {
              slidervalue = value;
            });
           
          },
          min: 0,
          max: 20,
        )),
        SizedBox(height: 30,),
          playerControls()
      ],)
    );
  }
}

class AlbumArt extends StatelessWidget {
  const AlbumArt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child:  
         Row(
        
          children: [
               SizedBox(width: 20,),

               singleAlbum('assets/img.jpeg') ,
               SizedBox(width: 20,),
               singleAlbum('assets/img3.jpeg') ,
               SizedBox(width: 20,),

               singleAlbum('assets/img2.jpeg') ,
               SizedBox(width: 20,),
                
          ],
         
      ),
    );
  }

  Container singleAlbum(String image) {
    return Container(
    height: 240,
    width: 240,
    child: Stack(
    children: [
     Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Center(child: Lottie.asset('assets/bg2.json', width: 240, height: 240, fit: BoxFit.contain))),  
      Center(
        child: Container(
          height: 160,
          width: 160,
          
          child: Center(child: Image.asset(image, scale: 1,))),
      ),
     ],
  )
  
  );
  }
}

class playerControls extends StatelessWidget {
  const playerControls({super.key});

  @override
  Widget build(BuildContext context) {
    return  const  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

         Control(
          icon: Icons.repeat,
        ),
         
        Control(
          icon: Icons.skip_previous,
        ),
        PlayerControl(),
        Control(
          icon: Icons.skip_next,
        ),
        Control(
          icon: Icons.shuffle,
        ),
      ],
    );
  }
}

class PlayerControl extends StatelessWidget {
  const PlayerControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: primaryColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: primaryColor.withOpacity(0.5),
                    offset: Offset(5, 10),
                    spreadRadius: 3,
                    blurRadius: 10),
                BoxShadow(
                    color: secondaryColor,
                    offset: Offset(-3, -4),
                    spreadRadius: -2,
                    blurRadius: 20)
              ],
            ),
            child: Stack(
              children: <Widget>[
                Center(
                  child: Container(
                    margin: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: primaryColor.withOpacity(0.5),
                              offset: Offset(5, 10),
                              spreadRadius: 3,
                              blurRadius: 10),
                          BoxShadow(
                              color: Colors.blue,
                              offset: Offset(-3, -4),
                              spreadRadius: -2,
                              blurRadius: 20)
                        ]),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.all(12),
                    decoration:
                        BoxDecoration(color: primaryColor, shape: BoxShape.circle),
                    child: Center(
                        child: Icon(
                 Icons.play_arrow,
                      size: 50,
                      color: secondaryColor,
                    )),
                  ),
                ),
              ],
            ),
          );
   
  }
}

class  Control extends StatelessWidget {
  const  Control({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle, boxShadow: [
          BoxShadow(color: primaryColor.withOpacity(0.5), 
          offset: Offset(5,10),
          spreadRadius: 3,
          blurRadius: 10
          ),
          BoxShadow(color: secondaryColor, offset: Offset(-3, -4), spreadRadius: -2, blurRadius: 20)
        ]
      ),
      child: Stack(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.5),
                    offset: Offset(5,10),
                    spreadRadius: 3, 
                    blurRadius: 10
                  ),

                   BoxShadow(
                    color: Colors.white,
                    offset: Offset(-3, -4),
                    spreadRadius: -2, 
                    blurRadius: 20
                  ),
                ]
              ),

            ),
          ),
          Center(
            child: Container(

              decoration: BoxDecoration(color: primaryColor, shape: BoxShape.circle),
              child: Center(
                child: Icon(icon, size: 30,color: Colors.black,),
              ),
            ),
          )
        ],
      )
    );
  }
}