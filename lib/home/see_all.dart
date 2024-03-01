import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SeeAll extends StatefulWidget {
  const SeeAll({super.key});

  @override
  State<SeeAll> createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  List <String> imagePath=["assets/images/Rectangle_60.png","assets/images/Frame_33.png","assets/images/Frame_32.png","assets/images/Frame _34.png"];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:  Column(
        children: [
          SizedBox(
            height: size.height*0.06,
          ),
          Padding(
            padding:  EdgeInsets.only(left: size.height*0.02),
            child: Row(
              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                },icon: Icon(Icons.arrow_back_ios,size:size.height*0.03 ,),),
                SizedBox(
                  width: size.width*0.2,
                ),
                AutoSizeText("Latest News",style: GoogleFonts.openSans(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                    fontSize: size.height*0.025
                ),),
              ],
            ),
          ),
          SizedBox(
            height: size.height *0.875,
            width: size.width * 1,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: imagePath.length,
              padding: EdgeInsets.only(top: size.height*0.02),
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.02,
                          right: size.width * 0.02,bottom: size.height*0.02),
                      child: InkWell(
                        onTap: () async {


                        },
                        child: Container(
                          height: size.height * 0.3,
                          width: size.width * 0.96,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(size.height*0.02)),
                            image:  DecorationImage(image: AssetImage(imagePath[index]),
                              fit: BoxFit.fill,

                            ),
                            border:Border.all(
                                color: Colors.black, width: 1),),


                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
