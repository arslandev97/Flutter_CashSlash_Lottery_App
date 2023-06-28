import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'dart:math';


class AboutDialogPopup extends StatefulWidget {
  @override
  _AboutDialogPopupState createState() => _AboutDialogPopupState();
}

class _AboutDialogPopupState extends State<AboutDialogPopup> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _showAboutDialogOnStart(),
      builder: (context, snapshot) {
        return Container(); // Replace with your main app widget
      },
    );
  }

  Future<bool> _showAboutDialogOnStart() async {
    await Future.delayed(Duration.zero);
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('About Developer', style: TextStyle(fontFamily: "Rubik Regular", fontSize: 16),)),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/arslandev.jpg'),
                radius: 50,
              ),
              SizedBox(height: 10),
              Text(
                'Muhammad Arslan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: "Pacisfic"),
              ),
              SizedBox(height: 5),
              Center(
                child: Text(
                  'I am an experienced Flutter developer with over 2 years of expertise in mobile app development. I hold certifications from both Microsoft and Google, validating my skills in this field.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    return true;
  }
}




class CircleBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final halfBorderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = const Color(0xff5c32c9)
      ..strokeWidth = 4;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi / 2,
      pi,
      false,
      halfBorderPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}



class LotteryButton extends StatelessWidget {
  final String number;
  final Function(dynamic) onPressed;

  const LotteryButton({
    required this.number,
    required this.onPressed,
  });



  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: const BorderSide(color: Colors.grey),
          ),
        ),
      ),
      onPressed: () {
        onPressed(number); // Pass the number value to the onPressed callback
      },
      child: Text(
        number,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}




void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int luckyNumber = 12;
  int guessNumber = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const  Color(0xff8158ed),
        appBar: AppBar(
          backgroundColor: const Color(0xff8158ed),
          title: const Center(
            child: Text("Welcome to CashSlash Lottery",style: TextStyle(
              fontFamily: "Pacisfic",
              fontSize: 18,

            ),),
          ),
        ),
        // backgroundColor: const Color(0xff4cb04f),
        body: SafeArea(
          child: Column(
            children: [
              AboutDialogPopup(),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Container(
                  height: 200,
                  width: 320,
                  decoration: BoxDecoration(
                    color: const Color(0xff8158ed).withOpacity(.6),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Totally Wining Amount", style: TextStyle(
                              fontFamily: "Pacisfic",
                              color: Colors.white,
                            ),),
                            const Padding(
                              padding: EdgeInsets.only(left: 5, top: 10),
                              child: Text("\$1000", style: TextStyle(
                                fontFamily: "Rubik Medium",
                                fontSize: 40,
                                color: Colors.white,
                              ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    guessNumber = 0;
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  width: 120,
                                  // padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                                  decoration:  BoxDecoration(
                                    color: const Color(0xfff3a23d),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: const Center(
                                    child: Text("Play Now!", style: TextStyle(
                                      fontFamily: "Rubik Medium",
                                      color: Colors.white,
                                    ), ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 4, color: const  Color(0xfff3a23d)),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xff6734ed).withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: CustomPaint(
                              painter: CircleBorderPainter(),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Remaining Time',
                                    style: TextStyle(fontFamily: "Pacisfic" ,fontSize: 16, color: Colors.white,),
                                  ),

                                  Text(
                                    '05h 23m',
                                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white,),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                height: 400,
                width: 400,
                child: guessNumber == 0 ? Column(
                  children: [
                    Container(
                      height: 90,
                      width: 320,
                      decoration: BoxDecoration(
                          color: const Color(0xff8158ed).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),]
                      ),

                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(image: AssetImage("assets/images/go.png"), width: 74,),
                          SizedBox(width: 20,),
                          Text("Are you ready to test your luck? \nThen choose a number!", textAlign: TextAlign.center,
                            style: TextStyle(fontFamily: "Pacisfic",  ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25,),
                    const Text("Choose Your Lucky Numbers\nYou have one chance", textAlign: TextAlign.center, style: TextStyle(
                      fontFamily: "Pacisfic",
                      letterSpacing: 3.0,
                      height: 1.2,
                      color: Colors.white70,
                    ),),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LotteryButton(number: '1', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '2', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '3', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '4', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        // Add more buttons here
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LotteryButton(number: '5', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '6', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '7', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '8', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        // Add more buttons here
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LotteryButton(number: '9', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '10', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '11', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '12', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        // Add more buttons here
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LotteryButton(number: '13', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '14', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '15', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '16', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        // Add more buttons here
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        LotteryButton(number: '17', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '18', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '19', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '20', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),

                        // Add more buttons here
                      ],
                    ),
                  ],
                ) :  guessNumber == luckyNumber ? Column(
                  children: [
                    Container(
                      height: 90,
                      width: 320,
                      decoration: BoxDecoration(
                          color: const Color(0xff8158ed).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),]
                      ),

                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(image: AssetImage("assets/images/02.png"), width: 74,),
                          SizedBox(width: 20,),
                          Text("Congratulations! You Won\nthe lottery price!", textAlign: TextAlign.center,
                            style: TextStyle(fontFamily: "Pacisfic", ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25,),
                    const Text("Choose Your Lucky Numbers\nYou have one chance", textAlign: TextAlign.center, style: TextStyle(
                      fontFamily: "Pacisfic",
                      letterSpacing: 3.0,
                      height: 1.2,
                      color: Colors.white70,
                    ),),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LotteryButton(number: '1', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '2', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '3', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '4', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        // Add more buttons here
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LotteryButton(number: '5', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '6', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '7', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '8', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        // Add more buttons here
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LotteryButton(number: '9', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '10', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '11', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '12', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        // Add more buttons here
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LotteryButton(number: '13', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '14', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '15', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '16', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        // Add more buttons here
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        LotteryButton(number: '17', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '18', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '19', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '20', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),

                        // Add more buttons here
                      ],
                    ),
                  ],
                ) : Column(
                  children: [
                    Container(
                      height: 90,
                      width: 320,
                      decoration: BoxDecoration(
                          color: const Color(0xff8158ed).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),]
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Image(image: AssetImage("assets/images/lose.png"), width: 74,),
                          const SizedBox(width: 20,),
                          Text("Sorry! You Lose. \nBetter luck Next Time\n Your Number is ${guessNumber.toString()}!", textAlign: TextAlign.center,
                            style: const TextStyle(fontFamily: "Pacisfic", ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25,),
                    const Text("Choose Your Lucky Numbers\nYou have one chance", textAlign: TextAlign.center, style: TextStyle(
                      fontFamily: "Pacisfic",
                      letterSpacing: 3.0,
                      height: 1.2,
                      color: Colors.white70,
                    ),),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LotteryButton(number: '1', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '2', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '3', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '4', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        // Add more buttons here
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LotteryButton(number: '5', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '6', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '7', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '8', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        // Add more buttons here
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LotteryButton(number: '9', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '10', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '11', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '12', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        // Add more buttons here
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LotteryButton(number: '13', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '14', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '15', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '16', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        // Add more buttons here
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        LotteryButton(number: '17', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '18', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '19', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),
                        LotteryButton(number: '20', onPressed: (value) => {
                          setState(() {
                            guessNumber = int.parse(value);
                          }),
                        }),

                        // Add more buttons here
                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}



