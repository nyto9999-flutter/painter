import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_svg/flutter_svg.dart';

class PageA extends StatelessWidget {
  static const path = 'page-a';

  const PageA({super.key});
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Group1Widget - GROUP
    return SizedBox(
      width: 425.03851318359375,
      height: 309,
      child: Stack(children: <Widget>[
        Positioned(
          top: 0,
          left: 0,
          child: SvgPicture.asset(
            'assets/images/ellipse1.svg',
            semanticsLabel: 'ellipse1',
          ),
        ),
        const Positioned(
          top: 234,
          left: 100,
          child: Text(
            'You’re 23 hours away from your reward.',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Tenor Sans',
                fontSize: 14,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1.5 /*PERCENT not supported*/
                ),
          ),
        ),
        Positioned(
          top: 189.35336303710938,
          left: 100.04108428955078,
          child: Transform.rotate(
            angle: -0.22802969751310817 * (math.pi / 180),
            child: Container(
              width: 325,
              height: 20,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Color.fromRGBO(217, 217, 217, 1),
              ),
            ),
          ),
        ),
        Positioned(
          top: 189.35336303710938,
          left: 100.04108428955078,
          child: Transform.rotate(
            angle: -0.22802969751310817 * (math.pi / 180),
            child: Container(
              width: 250,
              height: 20,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                gradient: LinearGradient(
                    begin:
                        Alignment(0.9999920725822449, -0.00031837652204558253),
                    end: Alignment(0.0003183768130838871, 0.006399949546903372),
                    colors: [
                      Color.fromRGBO(30, 184, 206, 1),
                      Color.fromRGBO(72, 69, 208, 1)
                    ]),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
