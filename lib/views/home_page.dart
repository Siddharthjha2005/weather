import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/DateTime%20Format/dates_format.dart';
import 'package:weather/Theme/app_fonts.dart';
import 'package:weather/provider/provider_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProviderService>().getWeather();
    context.read<ProviderService>().getHourly();
    context.read<ProviderService>().getDayWise();
  }

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
                  Consumer<ProviderService>(
                    builder: (ctx, value, child) {
                      var data = value.getWeatherData();
                      var wind = data[0].wind * 3.6;
                      var dt = DateTime.parse(data[0].dayDate);
                      String day = DatesFormat().extractDay(dt);
                      String month = DatesFormat().extractMonth(dt);
                      int date = dt.day;
                      return Container(
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
                                    Text(data[0].cityName,style: AppFonts()
                                        .heading1,),
                                    Text("$day, $month $date",style:
                                    AppFonts()
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
                            SizedBox(height: 30,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network("https://openweathermap"
                                    ".org/img/wn/${data[0].weatherIcon}@2x"
                                    ".png",
                                ),
                                SizedBox(width: 20,),
                                Column(
                                  children: [
                                    Text("${data[0].temp.round()}°",style: AppFonts()
                                        .mainDegree,),
                                    Text(data[0].desc,style: AppFonts()
                                        .heading1,),
                                    Text("Feels like ${data[0].feelTemp.round()}°",
                                      style:
                                    AppFonts()
                                        .heading5.copyWith(color: Colors.white),),
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
                                        Text("High : ${data[0].highTemp.round()}°C",
                                          style:
                                        AppFonts()
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
                                        Text("Low : ${data[0].lowTemp.round()}°C",
                                          style: AppFonts()
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
                                        Text("${data[0].humidity}%",style: AppFonts
                                          ().heading2,),
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
                                        Text("${wind.round()} Km/h",style:
                                        AppFonts().heading2,),
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
                                        Text("${data[0].pressure} hPa",style:
                                        AppFonts().heading2,),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20,),
                  Consumer<ProviderService>(
                      builder: (ctx, value, child) {
                        var data = value.getHourlyData();
                        return Container(
                          height: 120,
                          padding: EdgeInsets.symmetric(horizontal: 22),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              bool isNow = index == 0;
                              var dt = DateTime.parse(data[index].time);
                              int hour = dt.hour;
                              return Align(
                                alignment: Alignment.bottomCenter,
                                child: Transform.translate(
                                  offset: Offset(0, isNow?-10:0),
                                  child: Container(
                                    height: isNow?110:100,
                                    margin: EdgeInsets.only(left: 2,right: 2),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      // gradient: isNow?LinearGradient(
                                      //   colors: [
                                      //     Color(0xFF3A7BD5),
                                      //     Color(0xFF1E3C72),
                                      //     Color(0xFF0F2027),
                                      //   ],
                                      //   begin: Alignment.topLeft,
                                      //   end: Alignment.bottomRight,
                                      // ):null,
                                      color: isNow?Color(0xFF1E3C72):Colors.black45
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
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(index==0?"Now":"$hour:00",
                                          style:
                                        AppFonts()
                                            .heading5
                                            .copyWith(color: Colors.white),),
                                        Image.network("https://openweathermap"
                                            ".org/img/wn/${data[index]
                                            .weatherIcon}"
                                            ".png",width: 30,height: 30,
                                        ),
                                        Text("${data[index].temp.round()}°",style:
                                        AppFonts()
                                            .heading5
                                            .copyWith(color: Colors.white),),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
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
                              Text("5-Day Forecast",style: AppFonts().heading3,),
                              SizedBox(height: 20,),
                              Consumer<ProviderService>(
                                builder: (ctx, value, child) {
                                  var data = value.getDayWiseData();
                                  return ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount:data.length,
                                    itemBuilder: (context, index) {
                                      var dt = DateTime.parse(data[index].day);
                                      var shortDay = DatesFormat().extractShortDay(dt);
                                      return Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        padding: EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          color: Colors.blueAccent.shade100
                                              .withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            Text(shortDay,style:
                                            AppFonts()
                                                .heading5.copyWith(color:
                                            Colors.black,fontWeight: FontWeight
                                                .w600),),
                                            Image.network("https://openweathermap"
                                                ".org/img/wn/${data[index]
                                                .weatherIcon}"
                                                ".png",width: 40,height: 40,
                                            ),
                                            Text("${data[index].temp.round()}°C",
                                              style:
                                            AppFonts()
                                                .heading5.copyWith(color:
                                            Colors.black,fontWeight: FontWeight
                                                .w600),),
                                            Text(data[index].desc,style:
                                            AppFonts()
                                                .heading5.copyWith(color:
                                            Colors.black,fontWeight: FontWeight
                                                .w600),),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                              SizedBox(height: 20,),
                              Text("Sunrise & Sunset",style: AppFonts()
                                  .heading3,),
                              SizedBox(height: 20,),
                              Consumer<ProviderService>(
                                  builder: (ctx, value, child) {
                                    var data = value.getWeatherData();
                                    var sunrise = DateTime.fromMillisecondsSinceEpoch(data[0].sunrise);
                                    var sunset = DateTime
                                        .fromMillisecondsSinceEpoch(data[0]
                                        .sunset);
                                    var sunriseTime = DatesFormat().extractHour12Format(sunrise);
                                    var sunsetTime = DatesFormat()
                                        .extractHour12Format(sunset);
                                    return Container(
                                      padding: EdgeInsets.symmetric(horizontal: 40,
                                          vertical: 20),
                                      decoration: BoxDecoration(
                                        color: Colors.blueAccent.shade100.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Text("Sunrise",style: AppFonts()
                                                  .heading3,),
                                              Text(sunriseTime),
                                              // Text("${data[0].sunrise} am",style: AppFonts().heading3,),
                                              Icon(Icons.wb_sunny, color:
                                              Colors.orange,size: 60,),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text("Sunset",style: AppFonts()
                                                  .heading3,),
                                              Text(sunsetTime),
                                              // Text("${data[0].sunset} pm", style: AppFonts().heading3,),
                                              Icon(Icons.nights_stay, color: Colors.blueGrey,size: 60,),
                                            ],
                                          ),
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
