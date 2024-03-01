import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

class HotUpdates extends StatefulWidget {
  const HotUpdates({super.key});

  @override
  State<HotUpdates> createState() => _HotUpdatesState();
}

class _HotUpdatesState extends State<HotUpdates> {
  List <String> imagePath=["assets/images/Rectangle_60.png","assets/images/bike.jpg","assets/images/Frame_32.png","assets/images/Frame _34.png"];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title:  AutoSizeText("Hot Updates",style: GoogleFonts.aBeeZee(
            color: Colors.red,
            fontWeight: FontWeight.w500,
            fontSize: size.height*0.025
        ),),
      ),
      body: SizedBox(
        height: size.height*1,
        width: size.width*1,
        child: Padding(

          padding:  EdgeInsets.only(left: size.height*0.01,right: size.height*0.01,),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: size.height*0.01,
                ),


                SizedBox(
                  height: size.height*0.88,
                  width: size.width*1,
                  child: ListView.builder(
                    itemCount: imagePath.length,
                    //physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    padding:  EdgeInsets.all( size.height*0.002),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: size.height*0.5,
                        width: size.width*1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: size.height*0.18,
                              width: size.width*1,
                              decoration:  BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(size.height*0.02)),
                                  image: DecorationImage(image: AssetImage(imagePath[index]),
                                    fit: BoxFit.fill,

                                  )
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: size.height*0.01,),
                              child: AutoSizeText("Monday,10 May 2021",style: GoogleFonts.openSans(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: size.height*0.015
                              ),),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: size.height*0.01,),
                              child: AutoSizeText("Who classifies triple-mutant Covid variant from Indian as global health risk ",style: GoogleFonts.openSans(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.height*0.022
                              ),),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: size.height*0.01,),
                              child:  ReadMoreText(
                                  "A World Health Organization official said Monday it is reclassifying Covid World Health Organization official said Covid variant A World Health Organization official said Monday triple-mutant ",

                                trimLines: 4,
                                style: GoogleFonts.openSans(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: size.height*0.02
                                ),
                                colorClickableText: Colors.blue,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: 'Read more',
                                trimExpandedText: 'Read less',
                                moreStyle:   GoogleFonts.openSans(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w400,
                                  fontSize: size.height*0.02
                              ),),
                              ),

                            Padding(
                              padding: EdgeInsets.only(top: size.height*0.02,bottom: size.height*0.02),
                              child: AutoSizeText("published by Berkeley Lovelace" ,style: GoogleFonts.openSans(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: size.height*0.015
                              ),),
                            )
                          ],
                        ),
                      );
                    },),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
