import 'package:flutter/material.dart';

class FlipCardWidget extends StatefulWidget {
  final String frontText;
  final String backText;

  const FlipCardWidget({super.key, required this.frontText, required this.backText});

  @override
  State<FlipCardWidget> createState() => _FlipCardWidgetState();
}

class _FlipCardWidgetState extends State<FlipCardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  bool isFront = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
  }

  void _toggleCard() {
    if (isFront) {
      controller.forward();
    } else {
      controller.reverse();
    }
    setState(() {
      isFront = !isFront;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: GestureDetector(onTap: _toggleCard
                , child: AnimatedBuilder(
                    animation: animation,
                    builder: (context, child) {
                      return Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationY(animation.value * 3.14159),
                          child:animation.value<0.5?buildFrontCard():Transform.scale(scaleX: -1,scaleY: 1,child: buildBackCard(),),
        
                      );})
            ),
            ),
      SizedBox(height: 20,)
      // ,TextButton(onPressed: _toggleCard, style: TextButton.styleFrom(backgroundColor: Color(
      //       0xff1e6096)), child: Padding(
      //   padding: const EdgeInsets.fromLTRB(18,0,18,0),
      //   child: Text('Flip',style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),),
      // ),
      //   )
      ],
    );
    }
    Widget buildFrontCard() {
    return Container(
      width: 340,
      height: 200,
      decoration: BoxDecoration(
        color: Color(0xfff4f4f4),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 10,
            color: Color(0xffaaa9a9),
          ),
        ],),
      alignment: Alignment.center,
      child: Text(widget.frontText,style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xff454545)),),
    );

    }
    Widget buildBackCard() {
    return Container(
      width: 340,
      height: 200,
      decoration: BoxDecoration(
        color: Color(0xfff4f4f4),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 10,
            color: Color(0xffaaa9a9),
          ),
        ],),
      alignment: Alignment.center,
      child: Text(widget.backText),
    );
    }
}
