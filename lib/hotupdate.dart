import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/api/apis.dart';
import 'package:readmore/readmore.dart';

class HotUpdates extends StatefulWidget {
  const HotUpdates({
    super.key,
  });

  @override
  State<HotUpdates> createState() => _HotUpdatesState();
}

class _HotUpdatesState extends State<HotUpdates> {
  // List <String> imagePath=["assets/images/Rectangle_60.png","assets/images/bike.jpg","assets/images/Frame_32.png","assets/images/Frame _34.png"];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: AutoSizeText(
          "Hot Updates",
          style: GoogleFonts.aBeeZee(
              color: Colors.red,
              fontWeight: FontWeight.w500,
              fontSize: size.height * 0.025),
        ),
      ),
      body: SizedBox(
        height: size.height * 1,
        width: size.width * 1,
        child: StreamBuilder(
          stream: AllApis().articles(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              var data = json.decode(snapshot.data!.body);
              print("......................./////////$data");
              return snapshot.data?.statusCode == 200
                  ? Padding(
                      padding: EdgeInsets.only(
                        left: size.height * 0.01,
                        right: size.height * 0.01,
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            SizedBox(
                              height: size.height * 0.88,
                              width: size.width * 1,
                              child: ListView.builder(
                                itemCount: data.length,
                                //physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                padding: EdgeInsets.all(size.height * 0.002),
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    height: data[index]["content"].length >
                                                25 &&
                                            data[index]["content"].length < 35
                                        ? size.height * 0.6
                                        : data[index]["content"].length > 35
                                            ? size.height * 0.7
                                            : size.height * 0.53,
                                    width: size.width * 1,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: size.height * 0.18,
                                          width: size.width * 1,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      size.height * 0.02)),
                                              image: DecorationImage(
                                                image:
                                                NetworkImage(
                                                    data[index]["image"]),
                                                fit: BoxFit.fill,
                                              )),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: size.height * 0.01,
                                          ),
                                          child: AutoSizeText(
                                            "Monday,10 May 2021",
                                            style: GoogleFonts.openSans(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                fontSize: size.height * 0.015),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: size.height * 0.01,
                                          ),
                                          child: AutoSizeText(
                                            data[index]["title"],
                                            style: GoogleFonts.openSans(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: size.height * 0.022),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: size.height * 0.01,
                                          ),
                                          child: ReadMoreText(
                                            data[index]["content"],
                                            trimLines:
                                                data[index]["content"].length >
                                                            25 &&
                                                        data[index]["content"]
                                                                .length <
                                                            35
                                                    ? 5
                                                    : data[index]["content"]
                                                                .length >
                                                            35
                                                        ? 7
                                                        : 4,
                                            style: GoogleFonts.openSans(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontSize: size.height * 0.02),
                                            colorClickableText: Colors.blue,
                                            trimMode: TrimMode.Line,
                                            trimCollapsedText: 'Read more',
                                            trimExpandedText: 'Read less',
                                            moreStyle: GoogleFonts.openSans(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w400,
                                                fontSize: size.height * 0.02),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: size.height * 0.02,
                                              bottom: size.height * 0.02),
                                          child: AutoSizeText(
                                            "published by Berkeley Lovelace",
                                            style: GoogleFonts.openSans(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                                fontSize: size.height * 0.015),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : Center(
                      child: SizedBox(
                        child: AutoSizeText(
                          "Server Error.",
                          style: GoogleFonts.openSans(
                              color: Colors.black,
                              fontSize: size.height * 0.018,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
