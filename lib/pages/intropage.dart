import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introapp/pages/homepage.dart';
import 'package:introapp/utils/Strings.dart';

class IntroPage extends StatefulWidget {
  static final String id= 'intropage';
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(
        initialPage: 0
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            // #makePages
            PageView(
              onPageChanged: (int page) {
                setState(() {
                  currentIndex = page;
                });
              },
              controller: _pageController,
              children: <Widget>[
                makePage(
                    image: 'assets/images/image_1.png',
                    title: Strings.stepOneTitle,
                    content: Strings.stepOneContent,
                    skip: Strings.skip1
                ),
                makePage(
                    image: 'assets/images/image_2.png',
                    title: Strings.stepTwoTitle,
                    content: Strings.stepTwoContent,
                    skip: Strings.skip2
                ),
                makePage(
                    image: 'assets/images/image_3.png',
                    title: Strings.stepThreeTitle,
                    content: Strings.stepThreeContent,
                    skip: Strings.skip3
                ),
              ],
            ),
            // #indicators
            Container(
              margin: EdgeInsets.only(bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildIndicator(),
                ),
            )
          ],
        )
    );
  }
// #makePagesComponents
  Widget makePage({image, title, content, skip}) {
    return Container(
      //padding: EdgeInsets.only(left: 50,bottom: 30,right: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Column(
                children: <Widget>[
                  Text(title, style: TextStyle(color: Colors.red,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  Text(content,
                    style: TextStyle(color: Colors.grey, fontSize: 18,),
                    textAlign: TextAlign.center,),
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Image.asset(image),
                  ),
                  SizedBox(height: 150),
                ]
            ),
          ),
          // #skipButton
          Container(
            margin: EdgeInsets.only(right: 20, bottom: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, MyHomePage.id);
                    },
                    child:
                    Text(skip, style: TextStyle(color: Colors.red, fontSize: 18),)
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
// #indicatorInterface
  Widget _indicator(bool isActive){
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 5,
      width: isActive ? 30:6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(5)
      ),
    );
  }
// #indicatorCode
  List<Widget> _buildIndicator(){
    List<Widget> indicators = [];

    for(int i=0; i<3; i++){
      if(currentIndex == i){
        indicators.add(_indicator(true));
      }else{
        indicators.add(_indicator(false));
        }
    }
    return indicators;
  }
}
