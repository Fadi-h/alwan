import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactInformation extends StatelessWidget {
  const ContactInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.red,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      'assets/icons/color_design.png'
                  ),
                ),
              ),
              // child: Image.asset('assets/icons/white_design.png',fit: BoxFit.cover),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter:
                  ColorFilter.mode(Colors.white.withOpacity(0.2),
                      BlendMode.dstATop),
                  image: AssetImage(
                    'assets/icons/white_design.png',
                  ),
                ),
              ),
              // child: Image.asset('assets/icons/white_design.png',fit: BoxFit.cover),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter:
                  ColorFilter.mode(Colors.black.withOpacity(0.8),
                      BlendMode.dstATop),
                  image: AssetImage(
                      'assets/icons/black_design.png'
                  ),
                ),
              ),
              // child: Image.asset('assets/icons/white_design.png',fit: BoxFit.cover),
            ),
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.height * 0.4,
            //   child: Image.asset('assets/icons/black_design.png',fit: BoxFit.cover),
            // ),
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.height * 0.4,
            //   child: Image.asset('assets/icons/color_design.png',fit: BoxFit.cover),
            // ),
          ],
        ),
      ),
    );
  }
}
