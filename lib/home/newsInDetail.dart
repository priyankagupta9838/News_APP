import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../favorite.dart';

class DetailNews extends StatefulWidget {
  DetailNews({super.key, required this.imagepath});
  String imagepath;

  @override
  State<DetailNews> createState() => _DetailNewsState();
}

class _DetailNewsState extends State<DetailNews> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      body: SizedBox(
        height: size.height * 1,
        width: size.width * 1,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(

            children: [

              Stack(
                children: [
                  Container(
                    height: size.height * 0.52,
                    width: size.width * 1,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.imagepath), fit: BoxFit.fill),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: size.height * 0.05),
                      child: Container(
                        height: size.height * 0.05,

                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.black,
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: size.height*0.46),
                    child: Container(
                      height: size.height*0.6  ,
                      width: size.width*1,
                      padding: EdgeInsets.all(size.height*0.02),
                      decoration:BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(size.height*0.05,),topRight: Radius.circular(size.height*0.05))
,
                        border: Border.all(color: Colors.black54)

                      ),

                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height*0.13,
                          ),
                          Row(
                            children: [
                              AutoSizeText("What is Flutter used for? ",style: GoogleFonts.openSans(
                                fontSize: size.height*0.02,fontWeight: FontWeight.w600,

                              ),),
                              AutoSizeText(" Flutter is ",style: GoogleFonts.openSans(
                              fontSize: size.height*0.02,fontWeight: FontWeight.w400,

                              ),),
                              ],
                          ),
                          AutoSizeText("designed to support mobile apps that run on both Android and iOS, as well as interactive apps that you want to run on your web pages or on the desktop. Apps that need to deliver highly branded designs are particularly well suited for Flutter.",style: GoogleFonts.openSans(
                          fontSize: size.height*0.02,fontWeight: FontWeight.w500,

                          ),)

                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: size.height*0.37,left:  size.height*0.04,right: size.height*0.04),
                    child: Container(
                      height: size.height*0.23  ,
                      width: size.width*1,
                      padding: EdgeInsets.all(size.height*0.02),
                      decoration:BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(size.height*0.05,),topRight: Radius.circular(size.height*0.05),bottomRight: Radius.circular(size.height*0.05,),bottomLeft: Radius.circular(size.height*0.05,))
                          ,
                          border: Border.all(color: Colors.black54)

                      ),

                      child: Column(
                        children: [
                          Row(
                            children: [
                              AutoSizeText("What is Flutter used for?",style: GoogleFonts.openSans(
                                fontSize: size.height*0.02,fontWeight: FontWeight.w600,

                              ),),
                              AutoSizeText(" Flutter is  ",style: GoogleFonts.openSans(
                                fontSize: size.height*0.02,fontWeight: FontWeight.w400,

                              ),),
                            ],
                          ),
                          AutoSizeText("designed support mobile apps that run on both Android and iOS, as well as interactive apps that you want to run on your web pages or on the desktop. Apps that need to.",style: GoogleFonts.openSans(
                            fontSize: size.height*0.02,fontWeight: FontWeight.w400,

                          ),)

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
      floatingActionButton: Padding(
        padding:  EdgeInsets.only(bottom: size.height*0.03,right: size.height*0.02),
        child: GestureDetector(
          onTap: () async {
            // await showModalBottomSheet(
            // backgroundColor: Colors.black,
            // shape: const RoundedRectangleBorder(
            //     borderRadius: BorderRadius.only(
            //       topLeft: Radius.circular(35),
            //       topRight: Radius.circular(35),
            //     )
            // ),
            // context: context,
            // builder: (context) {
            //   return const Favorite ();
            // },);
          },
          child: CircleAvatar(
              backgroundColor: Colors.pink,
              radius: size.height * 0.04,
              child: Container(
                height: size.height * 0.04,
                width: size.width * 0.08,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/FavIcon.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
