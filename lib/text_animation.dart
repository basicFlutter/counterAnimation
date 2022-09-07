import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextAnimation extends StatefulWidget {
  const TextAnimation({Key? key}) : super(key: key);

  @override
  State<TextAnimation> createState() => _TextAnimationState();
}

class _TextAnimationState extends State<TextAnimation> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 10000), vsync: this);
    var curve = CurvedAnimation(parent: controller, curve: Curves.easeOut);
    animation = IntTween(begin:  0, end: 10).animate(curve)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        }
        if (status == AnimationStatus.dismissed) {
          // Navigator.pop(context);
        }
      });
  }

  double _value = 100.0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar:AppBar(
        title: Row(
          children: [
            SizedBox(
              width: screenWidth * 0.042,
              height: screenHeight * 0.042,
              child: SvgPicture.asset("assets/images/insta.svg",
                  color: Colors.grey),
            ),
            SizedBox(
              width:screenWidth*0.02,
            ),
            const Text("basic_flutter",style: TextStyle(color: Colors.grey),),
          ],
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            AnimatedFlipCounter(
              value: _value,
              duration: const Duration(seconds: 2),
              padding: const EdgeInsets.symmetric(vertical: 8),
              curve: Curves.elasticOut,
              textStyle: TextStyle(
                fontSize: 80,
                color: Colors.grey[800],
                fontWeight: FontWeight.bold,
                shadows: <Shadow>[
                  const  Shadow(
                    offset: Offset(0, -2),
                    blurRadius: 10.0,
                    color: Colors.black87,
                  ),
                  Shadow(
                    offset:const Offset(0, 1),
                    blurRadius: 2.0,
                    color: Colors.grey[600]!
                  ),
                ],
              ),
            ),

            SizedBox(
              height: screenHeight*0.05,
            ),

            Container(
              width: screenWidth*0.45,
              height: screenHeight*0.085,
              decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius:const BorderRadius.all(Radius.circular(50)),
                  boxShadow: [
                    const BoxShadow(
                      color: Colors.black87,
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, -2), // changes position of shadow
                    ),
                    BoxShadow(
                      color: Colors.grey[800]!,
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset:const Offset(0, 1), // changes position of shadow
                    ),
                  ]

              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.zero, // Set this
                        padding: EdgeInsets.zero, // and this
                        primary: Colors.grey[850],
                        shadowColor: Colors.black87,
                        elevation: 20,
                        // fixedSize: const Size(200, 200),
                        shape: const CircleBorder(),
                      ),
                      onPressed: (){
                        _value -=1;
                        setState((){});
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(Icons.keyboard_arrow_down,size: screenWidth*0.1,color: Colors.cyan),
                      )
                  ),

                  ElevatedButton(

                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey[850],
                        shadowColor: Colors.black87,
                        elevation: 20,
                        minimumSize: Size.zero, // Set this
                        padding: EdgeInsets.zero, // and this

                        // fixedSize: const Size(200, 200),
                        shape: const CircleBorder(),
                      ),
                      onPressed: (){
                        _value +=1;
                        setState((){});
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Icon(Icons.keyboard_arrow_up,size: screenWidth*0.1,color: Colors.cyan,),
                      )
                  ),

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}