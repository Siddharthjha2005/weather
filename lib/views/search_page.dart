import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:weather/provider/provider_service.dart';

import '../Theme/app_fonts.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  var searchController = TextEditingController();
  bool isLoading = false;
  int? currIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 10,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  controller: searchController,
                  onChanged: (value) {
                    if(value.isNotEmpty) {
                      context.read<ProviderService>().getSuggestions(city: value);
                      setState(() {});
                    }
                  },
                  autofocus: true,
                  style: AppFonts().heading3,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            TextButton(
                onPressed: (){
                  Get.back();
                },
                child: Text("Cancel",style: AppFonts().heading2.copyWith
                  (color: Colors.blue),),
            ),
          ],
        ),
      ),
      body: searchController.text.isNotEmpty? suggestionUI():recentUI(),
    );
  }

  Widget recentUI() {
    return Center(
      child: Text("Enter a location name.",style: AppFonts().heading4.copyWith
        (color: Colors.black),),
    );
  }

  Widget suggestionUI() {
    return Consumer<ProviderService>(
      builder: (context, value, child) {
        var data = value.suggestionsData();
        if(data.isEmpty){
          return Center(
            child: Text("No city found"),
          );
        }
        return Container(
          padding: EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text(data[index].cityName,style: AppFonts()
                        .heading4.copyWith(color: Colors.black),),
                    subtitle: Row(
                      children: [
                        Text("${data[index].state}, ",style: AppFonts().heading5.copyWith(color: Colors.black),),
                        Text(data[index].country,style: AppFonts().heading5
                            .copyWith(color: Colors.black),),
                      ],
                    ),
                    trailing: SizedBox(
                      width: 20,
                      height: 20,
                      child: (index==currIndex && isLoading)
                          ?CircularProgressIndicator(strokeWidth:
                      2,):SizedBox(),
                    ),
                    onTap: () async{
                      setState(() {
                        currIndex = index;
                        isLoading = true;
                      });
                      String selectedCity = data[index].cityName;

                      await context.read<ProviderService>().getWeather(city:
                      selectedCity);
                      await context.read<ProviderService>().getHourly(city:
                      selectedCity);
                      await context.read<ProviderService>().getDayWise(city:
                      selectedCity);

                      setState(() {
                        isLoading = false;
                      });

                      Get.back();
                    },
                  ),
                  Divider(),
                ],
              );
            },
          ),
        );
      },
    );
  }

}





