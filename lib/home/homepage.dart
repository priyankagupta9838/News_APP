import 'package:auto_size_text/auto_size_text.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/home/see_all.dart';
import 'package:searchfield/searchfield.dart';
import '../hotupdate.dart';
import 'filterbottomSheet.dart';
import 'newsInDetail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List <String>fields =["Health","Technology","Finance","Art","Game","Health","Technology","Finance",];
  List <String> imagePath=["assets/images/Rectangle_60.png","assets/images/Rectangle_60.png","assets/images/bike.jpg","assets/images/Rectangle_60.png"];
  List <dynamic> selectedFilter=[false,false,false,false,false,false,false,false,];
  bool filter=false;
  SearchController searchController=SearchController();
  bool searchtrue=false;



  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height*1,
        width: size.width*1,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: size.height*0.07,
              ),
              SizedBox(
                height: size.height*0.05,
                width: size.width*1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: size.height*0.05,
                          width: size.width*0.8,
                          child: SearchField(
                            onSearchTextChanged: (p0) {
                              setState(() {
                                searchtrue=true;
                              });
                            },
                            suggestionItemDecoration: SuggestionDecoration(),
                            key: const Key('search field'),

                           controller: searchController,

                            searchStyle: GoogleFonts.openSans(
                                color: Colors.black,
                                fontSize: size.height*0.02,
                                fontWeight: FontWeight.w400),
                            suggestionStyle: GoogleFonts.openSans(
                              color: Colors.black,
                              fontSize: size.height*0.02,
                              fontWeight: FontWeight.w800,
                            ),
                            marginColor: Colors.black,
                            suggestionsDecoration: SuggestionDecoration(
                                color: const Color.fromRGBO(40, 130, 146, 1),
                                //shape: BoxShape.rectangle,
                                padding:  EdgeInsets.all(size.height*0.02),
                                border: Border.all(width: 1, color: Colors.black),
                                borderRadius: BorderRadius.circular(size.height*0.04)),
                            searchInputDecoration: InputDecoration(
                                 contentPadding: EdgeInsets.only(top: size.height*0.01,left: size.height*0.03),

                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(size.height*0.04)
                              ),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(size.height*0.04)
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(size.height*0.04)
                              ),
                              suffixIcon:
                              searchtrue
                                ?
                              IconButton(onPressed: (){
                                setState(() {
                                  searchController.clear();
                                  searchtrue=false;
                                });
                              }, icon: Icon(Icons.clear_outlined,color: Colors.grey,size: size.height*0.025,))

                                 :
                              IconButton(onPressed: (){}, icon: Icon(Icons.search_outlined,color: Colors.grey,size: size.height*0.025,))
                                ,

                              fillColor: Colors.white,
                              filled: true,
                            hintStyle: GoogleFonts.openSans(
                                  color: Colors.black26,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                              border:InputBorder.none

                            ),
                            onSuggestionTap: (value) {

                            },
                            enabled: true,
                            hint: "Dogecoin to the moon...",

                            itemHeight: 50,
                            maxSuggestionsInViewPort: 3, suggestions: [],
                          ),
                        ),
                        ],
                    ),

                    CircleAvatar(
                      radius: size.height*0.03,
                        backgroundColor: Colors.red.shade400,
                        child: IconButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return const HotUpdates();
                              },));

                            },
                            icon: const Icon(Icons.notifications_none_rounded,color: Colors.grey,)))
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: size.height*0.01,right: size.height*0.01,top: size.height*0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText("Latest News",style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: size.height*0.025
                    ),),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SeeAll(),));
                    }, child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText("See all",style: GoogleFonts.openSans(
                            color: Colors.blue,
                            fontWeight: FontWeight.w400,
                            fontSize: size.height*0.015
                        ),),
                        SizedBox(
                          width: size.width*0.02,
                        ),
                        Icon(CupertinoIcons.arrow_right,size: size.height*0.02,color: Colors.blue,)
                      ],
                    ),)
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.3,
                width: size.width * 1,
                child:Swiper(
                  scrollDirection:Axis.horizontal,

                  controller: SwiperController(),
                  autoplay: true,
                  itemBuilder:(BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.016,
                          right: size.width * 0.016),
                      child: InkWell(
                        onTap: () async {

                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailNews(imagepath: imagePath[index],),));
                        },
                        child: Container(
                          height: size.height * 0.3,
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(size.height*0.02)),
                            image:  DecorationImage(image: AssetImage(imagePath[index]),
                              fit: BoxFit.fill,

                            ),

                          ),
                          child: Padding(
                            padding:  EdgeInsets.all(size.height*0.02),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AutoSizeText("5 thing to know about the flutter which is very important",
                                    style: GoogleFonts.openSans(
                                    color:
                                    Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: size.height*0.026
                                )),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    AutoSizeText("Matt villano",
                                        style: GoogleFonts.openSans(
                                            color:
                                            Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: size.height*0.02
                                        )),
                                    AutoSizeText("Sunday,25 Feb 2024",
                                        style: GoogleFonts.openSans(
                                            color:
                                            Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: size.height*0.02
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ),


                        ),
                      ),
                    );
                  },
                  itemCount: imagePath.length,
                  pagination:  SwiperPagination(),
                  layout: SwiperLayout.DEFAULT,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.016,
                          right: size.width * 0.016,top: size.height*0.01),
                      child: GestureDetector(
                        onTap: () async {
                          setState(() {
                            filter =!filter;
                          });
                          showModalBottomSheet(
                            constraints: BoxConstraints(
                                maxHeight: size.height*0.4,minHeight: size.height*0.4),
                            backgroundColor: Colors.white,

                            shape:  RoundedRectangleBorder(
                               borderRadius: BorderRadius.only(topRight: Radius.circular(size.height*0.02),topLeft: Radius.circular(size.height*0.02))
                            ),
                            context: context,
                            builder: (context) {
                              return const FilterBottomSheet();
                            },);


                        },
                        child: Container(
                          height: size.height * 0.04,
                          width: size.width * 0.22,
                          decoration: BoxDecoration(
                            color:
                            filter
                                ?

                            Colors.redAccent.shade700
                                :
                                Colors.white,


                            borderRadius: BorderRadius.all(Radius.circular(size.height*0.04)),
                            border: Border.all(
                                color:
                                filter
                                ?
                                    Colors.transparent
                                :

                                Colors.black87,width: 1)
                           ),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.filter_alt_rounded,

                                color:
                                filter
                                    ?
                                Colors.white
                                    :
                                Colors.black,
                              ),
                              AutoSizeText("Filter",style: GoogleFonts.openSans(
                                  color:
                                  filter
                                  ?
                                      Colors.white
                                  :
                                  Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: size.height*0.02
                              )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                      width: size.width * 0.22*fields.length,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: fields.length,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(top: size.height*0.01),
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: size.width * 0.016,
                                    right: size.width * 0.016),
                                child: GestureDetector(
                                  onTap: () async {
                                    setState(() {
                                      selectedFilter[index]=!selectedFilter[index];
                          print(fields[index].length);

                                    });
                                  },
                                  child: Container(
                                    height: size.height * 0.04,
                                    width: fields[index].length>=7
                                    ?
                                    size.width * 0.26
                                        :
                                    size.width * 0.2
                                    ,
                                    decoration: BoxDecoration(
                                      color:
                                      selectedFilter[index]
                                      ?
                                        Colors.redAccent.shade700
                                    :
                                      Colors.white,

                                      borderRadius: BorderRadius.all(Radius.circular(size.height*0.04)),
                                      border:Border.all(
                                          color:
                                          selectedFilter[index]
                                              ?
                                          Colors.transparent
                                              :

                                          Colors.black87,width: 1),),

                                        child: Center(child: AutoSizeText(fields[index],style: GoogleFonts.openSans(
                                            color:
                                            selectedFilter[index]
                                                ?
                                            Colors.white
                                                :
                                            Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: size.height*0.017
                                            )
                                        ),),
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
              ),

              SizedBox(
                height:  size.height * 0.2*imagePath.length-1+0.02,
                width: size.width * 1,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: imagePath.length-1,
                  padding: EdgeInsets.only(top: size.height*0.01),
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: size.width * 0.016,
                              right: size.width * 0.016,top: size.height*0.02),
                          child: InkWell(
                            onTap: () async {
                              setState(() {

                              });

                            },
                            child: Container(
                              height: size.height * 0.2,
                              width: size.width * 0.95,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(size.height*0.02)),
                                color: Colors.grey,
                                image: DecorationImage(image: AssetImage(imagePath[index+1]),
                                  fit: BoxFit.fill,

                                ),
                                
                                shape: BoxShape.rectangle,
                               ),
                              child: Padding(
                                padding:  EdgeInsets.all(size.height*0.02),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    AutoSizeText("5 thing to know about the flutter which is very important",
                                        style: GoogleFonts.openSans(
                                            color:
                                            Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: size.height*0.022
                                        )),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        AutoSizeText("Matt villano",
                                            style: GoogleFonts.openSans(
                                                color:
                                                Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: size.height*0.018
                                            )),
                                        AutoSizeText("Sunday,25 Feb 2024",
                                            style: GoogleFonts.openSans(
                                                color:
                                                Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: size.height*0.018
                                            )),
                                      ],
                                    )
                                  ],
                                ),
                              ),


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
        ),
      ),

    );
  }
}
