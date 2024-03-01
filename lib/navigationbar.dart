import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/profile.dart';
import 'package:page_transition/page_transition.dart';

import 'favorite.dart';
import 'home/homepage.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  PageController pageController = PageController();
  final screens=[
    const HomePage(),
    const Favorite(),
    const Profile(),
    ];
  int currIndex=0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:screens[currIndex] ,
      floatingActionButton: Padding(
        padding:  EdgeInsets.only(left: size.height*0.05,right: size.height*0.03,bottom: size.height*0.03),
        child: Container(
          height: size.height * 0.08,
          width: size.width*0.8,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:  BorderRadius.all(
                Radius.circular(size.height*0.04),


              ),
              border:Border.all(color: Colors.grey)
          ),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currIndex=0;
                    });


                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: size.height*0.01),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Padding(
                          padding: EdgeInsets.only(bottom: size.height*0.01),
                          child: Container(
                            height: size.height*0.005,
                            width: size.width*0.11,
                            decoration: BoxDecoration(
                                color: currIndex==0
                                    ?
                                Colors.grey.shade400
                                    :
                                Colors.white
                                ,
                                borderRadius: BorderRadius.all(Radius.circular(size.height*0.04))
                            ),
                          ),
                        )
                         ,
                        currIndex==0
                            ?
                        Container(
                          height: size.height * 0.03,
                          width: size.width * 0.07,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/icons/homeActiveIcon.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                            :
                        Container(
                          height: size.height * 0.03,
                          width: size.width * 0.07,
                          decoration: const BoxDecoration(
                            image: DecorationImage(image: AssetImage("assets/icons/homeIcon.png"),
                              fit: BoxFit.fill,

                            ),
                          ),
                        ),
                        AutoSizeText("Home",style: GoogleFonts.openSans(
                          fontSize: size.height*0.01,
                          color:
                          currIndex==0
                              ?
                              Colors.black87
                              :
                          Colors.black54,
                          fontWeight: FontWeight.w700,

                        ),)
                      ],
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      currIndex=1;
                    });

                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: size.height*0.01),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Padding(
                          padding: EdgeInsets.only(bottom: size.height*0.01),
                          child: Container(
                            height: size.height*0.005,
                            width: size.width*0.11,
                            decoration: BoxDecoration(
                                color: currIndex==1
                                    ?
                                Colors.grey.shade400
                                    :
                                Colors.white
                                ,
                                borderRadius: BorderRadius.all(Radius.circular(size.height*0.04))
                            ),
                          ),
                        )
                        ,
                        currIndex==1
                        ?
                        Container(
                          height: size.height * 0.03,
                          width: size.width * 0.07,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/icons/favoriteActiveIcon.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                        :
                        Container(
                          height: size.height * 0.03,
                          width: size.width * 0.07,
                          decoration: const BoxDecoration(
                            image: DecorationImage(image: AssetImage("assets/icons/favorioteIcon.png"),
                              fit: BoxFit.fill,

                            ),
                          ),
                        ),

                        AutoSizeText("Favorite",
                          style: GoogleFonts.openSans(
                            fontSize: size.height*0.01,
                           color:  currIndex==1
                               ?
                           Colors.black87
                               :
                           Colors.black54,
                            fontWeight: FontWeight.w700,


                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currIndex=2;
                    });

                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: size.height*0.01),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [


                        Padding(
                          padding: EdgeInsets.only(bottom: size.height*0.01),
                          child: Container(
                            height: size.height*0.005,
                            width: size.width*0.11,
                            decoration: BoxDecoration(
                                color:
                                currIndex==2
                                    ?
                                Colors.grey.shade400
                                :
                                    Colors.white
                                ,
                                borderRadius: BorderRadius.all(Radius.circular(size.height*0.04))
                            ),
                          ),
                        ),
                        currIndex==2
                        ?
                        Container(
                          height: size.height * 0.03,
                          width: size.width * 0.07,
                          decoration: const BoxDecoration(
                            image: DecorationImage(image: AssetImage("assets/icons/profileIcon.png"),
                              fit: BoxFit.fill,

                            ),
                          ),
                        )
                        :
                        Container(
                          height: size.height * 0.03,
                          width: size.width * 0.07,
                          decoration: const BoxDecoration(
                            image: DecorationImage(image: AssetImage("assets/icons/profile.png"),
                              fit: BoxFit.fill,

                            ),
                          ),
                        )
                        ,
                        AutoSizeText("Profile",
                          style: GoogleFonts.openSans(
                            fontSize: size.height*0.01,
                            color:   currIndex==2
                                ?
                            Colors.black87
                                :
                            Colors.black54,
                            fontWeight: FontWeight.w700,


                          ),)
                      ],
                    ),
                  ),
                ),


              ]),
        ),
      ),
    );
  }
}
