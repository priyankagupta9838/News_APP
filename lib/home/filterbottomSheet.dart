import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  bool recommended=false;
  bool letest=false;
  bool mostViewed=false;
  bool channel=false;
  bool following=false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Container(
           height: size.height*0.4,
      width: size.width*1,
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.only(topLeft:Radius.circular(size.height*0.03),topRight: Radius.circular(size.height*0.03))
      ),
      child: Padding(
        padding: EdgeInsets.only(left: size.height*0.02,right: size.height*0.02,top: size.height*0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText("Filter",style: GoogleFonts.aBeeZee(
                    fontSize: size.height*0.03,
                    fontWeight: FontWeight.w700
                ),),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      recommended=false;
                      letest=false;
                      mostViewed=false;
                      channel=false;
                      following=false;
                    });
                  },
                  child: Container(
                    height: size.height*0.045,
                    width: size.height*0.12,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(size.height*0.03)),
                        color: Colors.white,
                        border: Border.all(color: Colors.black54)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.delete_outline_rounded,size: size.height*0.025, color: Colors.black87),
                        AutoSizeText("Reset",style: GoogleFonts.aBeeZee(
                            fontSize: size.height*0.02,
                            fontWeight: FontWeight.w500,
                          color: Colors.black87
                        ),)
                      ],
                    ),


                  ),
                ),



              ],
            ),
            SizedBox(
              height: size.height*0.02,
            ),
            AutoSizeText("Sort By",style: GoogleFonts.aBeeZee(
                fontSize: size.height*0.022,
                fontWeight: FontWeight.w600)
            ),
            Padding(
              padding:EdgeInsets.only(top: size.height*0.02,bottom: size.height*0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        recommended=!recommended;

                      });
                    },
                    child: Container(
                      height: size.height*0.043,
                      width: size.width*0.35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(size.height*0.04)),
                          border: Border.all(color: Colors.grey.shade300),
                          color: recommended==true
                              ?
                          Colors.redAccent.shade400
                              :
                          Colors.white
                      ),
                      child:  Center(
                        child: AutoSizeText("Recommended",

                            style: GoogleFonts.aBeeZee(
                                color:
                                recommended==true
                                ?
                                    Colors.white
                                :
                                Colors.black,

                                fontSize: size.height*0.017,
                                fontWeight: FontWeight.w500
                            )),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        letest=!letest;
                      });
                    },
                    child: Container(
                      height: size.height*0.043,
                      width: size.width*0.22,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(size.height*0.04)),
                          border: Border.all(color: Colors.grey.shade300),
                          color: letest==true
                              ?
                          Colors.redAccent.shade400
                              :
                          Colors.white
                      ),
                      child:  Center(
                        child: AutoSizeText("Latest",

                            style: GoogleFonts.aBeeZee(
                                color:
                                letest==true
                                ?
                                    Colors.white
                                :
                                Colors.black,

                                fontSize: size.height*0.017,
                                fontWeight: FontWeight.w500
                            )),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        mostViewed=!mostViewed;
                      });
                    },
                    child: Container(
                      height: size.height*0.043,
                      width: size.width*0.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(size.height*0.04)),
                          border: Border.all(color: Colors.grey.shade300),
                          color: mostViewed==true
                              ?
                          Colors.redAccent.shade400
                              :
                          Colors.white
                      ),
                      child:  Center(
                        child: AutoSizeText("Most Viewed",

                            style: GoogleFonts.aBeeZee(
                                color: mostViewed==true
                                    ?
                                Colors.white
                                    :
                                Colors.black,



                                fontSize: size.height*0.017,
                                fontWeight: FontWeight.w500
                            )),
                      ),
                    ),
                  )

                ],
              ),
            ),
            Padding(
              padding:EdgeInsets.only(bottom: size.height*0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        channel=!channel;
                      });
                    },
                    child: Container(
                      height: size.height*0.043,
                      width: size.width*0.22,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(size.height*0.04)),
                          border: Border.all(color: Colors.grey.shade300),
                          color: channel==true
                              ?
                          Colors.redAccent.shade400
                              :
                          Colors.white
                      ),
                      child:  Center(
                        child: AutoSizeText("Channel",

                            style: GoogleFonts.aBeeZee(
                                color: channel==true
                                    ?
                                Colors.white
                                    :
                                Colors.black,

                                fontSize: size.height*0.017,
                                fontWeight: FontWeight.w500
                            )),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: (){
                      setState(() {
                        following=!following;

                      });
                    },
                    child: Container(
                      height: size.height*0.043,
                      width: size.width*0.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(size.height*0.04)),
                          border: Border.all(color: Colors.grey.shade300),
                          color: following==true
                              ?
                          Colors.redAccent.shade400
                              :
                          Colors.white
                      ),
                      child:  Center(
                        child: AutoSizeText("Following",

                            style: GoogleFonts.aBeeZee(
                                color: following==true
                                    ?
                                Colors.white
                                    :
                                Colors.black,
                                fontSize: size.height*0.017,
                                fontWeight: FontWeight.w500
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width*0.2,
                  )
                ],
              ),
            ),
            Padding(
              padding:EdgeInsets.only(top: size.height*0.02,),
              child: SizedBox(
                  height: size.height*0.065,
                  width: size.width*1,
                  child: ElevatedButton(

                    onPressed: (){
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent.shade400,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(size.height*0.04)))
                    ),
                    child: AutoSizeText("SAVE",

                        style: GoogleFonts.aBeeZee(
                            color: Colors.white,

                            fontSize: size.height*0.023,
                            fontWeight: FontWeight.w600
                        )),
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}
