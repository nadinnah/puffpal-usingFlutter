import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlipCardWidget extends StatefulWidget {
  final String frontText;
  final String backText;

  const FlipCardWidget({
    super.key,
    required this.frontText,
    required this.backText,
  });

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
      duration: Duration(milliseconds: 300),
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
        Center(
          child: GestureDetector(
            onTap: _toggleCard,
            child: AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(animation.value * 3.14159),
                  child: animation.value < 0.5
                      ? buildFrontCard()
                      : Transform.scale(
                          scaleX: -1,
                          scaleY: 1,
                          child: buildBackCard(),
                        ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget buildFrontCard() {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double verticalSpacing = screenHeight * 0.25;
    final double titleSize = screenHeight * 0.07;
    final double subtitleSize = screenHeight * 0.055;
    final double bodySize = screenHeight * 0.035;

    return Container(
      width: double.infinity,
      height: verticalSpacing,
      decoration: BoxDecoration(
        color: Color(0xffebeeff),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(offset: Offset(0, 4), blurRadius: 4, color: Colors.black26),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        widget.frontText,
        textAlign: TextAlign.center,
        style: GoogleFonts.roboto(
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w100,
          fontSize: bodySize,
          color: Color(0xff1e1b1b),
        ),
      ),
    );
  }

  Widget buildBackCard() {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double verticalSpacing = screenHeight * 0.25;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double horizontalPadding = screenWidth * 0.09;
    final double titleSize = screenWidth * 0.07;
    final double subtitleSize = screenWidth * 0.055;
    final double bodySize = screenWidth * 0.035;

    return Container(
      width: double.infinity,
      height: verticalSpacing,
      decoration: BoxDecoration(
        color: Color(0xffebeeff),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(offset: Offset(0, 4), blurRadius: 4, color: Colors.black26),
        ],
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.all(horizontalPadding),
        child: Text(
          widget.backText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: bodySize,
            fontWeight: FontWeight.bold,
            color: Color(0xff454545),
          ),
        ),
      ),
    );
  }
}
