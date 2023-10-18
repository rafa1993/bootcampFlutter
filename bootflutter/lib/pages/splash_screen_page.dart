import 'package:bootflutter/pages/cep_page.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.green,
              Colors.greenAccent,
            ],
                stops: [
              0.3,
              0.7,
            ])),
        child: Center(
          child: SizedBox(
            width: 250.0,
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
              child: AnimatedTextKit(
                totalRepeatCount: 4,
                repeatForever: false,
                onFinished: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (builder) => const CepPage()));
                },
                animatedTexts: [
                  FadeAnimatedText('meu App Bootcamp'),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}