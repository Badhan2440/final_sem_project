import 'package:final_sem_project/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';




class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea (
    child: IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'Send an enquiry',
          body: 'Search your enquiry amd get the most suitable response from expert doctor.',
          image: buildImage('assets/delivery.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Choose relevant doctor',
          body: 'Select your preferable doctor who will do the best cure of your problem.',
          image: buildImage('assets/doct.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Make an appointment',
          body: 'Fix your appointment with doctor at a suitable time.',
          image: buildImage('assets/medical-history.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Video call with doctor',
          body: 'For more detailed enquiry make a video call and share your problem with doctor',
          image: buildImage('assets/video-call.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Get professional help',
          body: 'Get the most preferable solution from our expert doctors and make yourself safe and sound',
          image: buildImage('assets/healthcare.png'),
          decoration: getPageDecoration(),
        ),
      ],

      done: Text('NEXT', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.redAccent),),
      onDone: () => goToHome(context),
      showSkipButton: true,
      skip: Text('SKIP', style: TextStyle(color: Colors.redAccent),),
      onSkip: () => goToHome(context),
      next: Icon(Icons.arrow_forward, color: Colors.redAccent,),
      dotsDecorator: getDotDecoration(),
      onChange: (index) => print('Page $index selected'),
      globalBackgroundColor: Colors.black,

      nextFlex: 0,
    ),
  );

  void goToHome(context) => Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => LoginScreen()),
  );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
    color: Colors.redAccent,
    size: Size(10, 10),
    activeSize: Size(22, 10),
    activeColor: Colors.white,
    activeShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
  );

  PageDecoration getPageDecoration() => PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.redAccent),
    bodyTextStyle: TextStyle(fontSize: 15, color: Colors.white),
    imagePadding: EdgeInsets.all(24),
    pageColor: Colors.black,
  );

}


