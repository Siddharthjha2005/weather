import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:weather/Theme/app_fonts.dart';
import 'package:weather/provider/provider_service.dart';

class ManageCities extends StatefulWidget {
  const ManageCities({super.key});

  @override
  State<ManageCities> createState() => _ManageCitiesState();
}

class _ManageCitiesState extends State<ManageCities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Manage cities",style: AppFonts().heading1.copyWith(color:
            Colors.black,fontSize: 34),),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Get.toNamed("/searchPage");
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Enter location",
                    hintStyle: AppFonts().heading3.copyWith(color: Colors.grey),
                    border: InputBorder.none,
                    enabled: false,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Consumer<ProviderService>(
                builder: (context, value, child) {
                  var data = value.weatherData();
                  if(data.isEmpty){
                    return Center(child: CircularProgressIndicator(),);
                  }
                  return Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data[0].cityName,style: AppFonts().heading1,),
                            Row(
                              children: [
                                Text("High : ${data[0].highTemp.round()}°C / "
                                    "",style: AppFonts().heading4,),
                                Text("Low : ${data[0].lowTemp.round()}°C",
                                  style: AppFonts().heading4,),
                              ],
                            ),
                          ],
                        ),
                        Text("${data[0].temp.round()}°",style: AppFonts()
                            .mainDegree.copyWith(fontWeight: FontWeight.w400),),
                      ],
                    ),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}
