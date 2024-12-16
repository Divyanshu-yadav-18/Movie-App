import 'package:flutter/material.dart';
import 'package:movie_app/core/configs/assets/app_image.dart';

class splashPage extends StatelessWidget {
  const splashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImage.splashBackground),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xff1A1B20).withOpacity(0),
                  const Color(0xff1A1B20),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
