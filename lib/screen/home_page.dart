import 'package:flutter/material.dart';
import 'package:weather/Theme/app_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF3A7BD5),
                          Color(0xFF1E3C72),
                          Color(0xFF0F2027),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text("Berlin, Germany",style: AppFonts().heading1,),
                                Text("Monday, June 23",style: AppFonts()
                                    .heading4,),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black38,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.search,color: Colors.white,size:
                                26,),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.sunny,size: 80,color: Colors.yellow,),
                            SizedBox(width: 20,),
                            Column(
                              // spacing: -15,
                              children: [
                                Text("24°",style: AppFonts().mainDegree,),
                                Text("Partly Cloudy",style: AppFonts().heading1,),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 30,),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10,
                                    vertical: 12),
                                decoration: BoxDecoration(
                                  color: Colors.black38,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("High : 26°C",style: AppFonts()
                                        .heading4,),
                                    SizedBox(width: 10,),
                                    Icon(Icons.north_east,color: Colors.white,size:
                                    16,),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10,
                                    vertical: 12),
                                decoration: BoxDecoration(
                                  color: Colors.black38,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Low : 18°C",style: AppFonts()
                                        .heading4,),
                                    SizedBox(width: 10,),
                                    Icon(Icons.south_east,color: Colors.red,size:
                                    16,),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15,
                              vertical: 20),
                          decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Text("Humidity",style: AppFonts()
                                        .heading5,),
                                    Text("62%",style: AppFonts().heading2,),
                                  ],
                                ),
                                VerticalDivider(
                                  color: Colors.grey,
                                  thickness: 1.3,
                                  indent: 6,
                                  endIndent: 6,
                                ),
                                Column(
                                  children: [
                                    Text("Wind",style: AppFonts().heading5,),
                                    Text("19 Km/h",style: AppFonts().heading2,),
                                  ],
                                ),
                                VerticalDivider(
                                  color: Colors.grey,
                                  thickness: 1.3,
                                  indent: 6,
                                  endIndent: 6,
                                ),
                                Column(
                                  children: [
                                    Text("Pressure",style: AppFonts()
                                        .heading5,),
                                    Text("1006 hPa",style: AppFonts().heading2,),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 120,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                        itemBuilder: (context, index) {
                        bool isNow = index == 0;
                          return Align(
                            alignment: Alignment.bottomCenter,
                            child: Transform.translate(
                              offset: Offset(0, isNow?-10:0),
                              child: Container(
                                height: isNow?110:90,
                                margin: EdgeInsets.only(left: 2,right: 2),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: isNow?Colors.white12:Colors.black45
                                      .withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: isNow
                                      ? [
                                    BoxShadow(
                                      color: Colors.white12,
                                      blurRadius: 10,
                                    )
                                  ] : [],
                                ),
                                child: Column(
                                  children: [
                                    Text(index==0?"Now":"11:00",style: AppFonts()
                                        .heading5
                                        .copyWith(color: Colors.white),),
                                    // Image(),
                                    Text("20°",style: AppFonts().heading5
                                        .copyWith(color: Colors.white),),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              DraggableScrollableSheet(
                initialChildSize: 0.26,
                minChildSize: 0.25,
                  maxChildSize: 0.9,
                  expand: true,
                  builder: (context, scrollController) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              SizedBox(height: 20,),
                              Text("7-Day Forecast",style: AppFonts().heading3,),
                              SizedBox(height: 20,),
                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 7,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: Colors.blueAccent.shade100.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text("Mon",style: AppFonts()
                                              .heading5.copyWith(color:
                                          Colors.black,fontWeight: FontWeight
                                              .w600),),
                                          Text("Image",style: AppFonts()
                                              .heading5.copyWith(color:
                                          Colors.black,fontWeight: FontWeight
                                              .w600),),
                                          Text("26°C",style: AppFonts()
                                              .heading5.copyWith(color:
                                          Colors.black,fontWeight: FontWeight
                                              .w600),),
                                          Text("Partly Cloudy",style: AppFonts()
                                              .heading5.copyWith(color:
                                          Colors.black,fontWeight: FontWeight
                                              .w600),),
                                        ],
                                      ),
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
