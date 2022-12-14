// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors, camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weather_app_ui/core/app_asset.dart';
import 'package:weather_app_ui/models/weather_location.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app_ui/provider/weather_provider.dart';
import 'package:weather_app_ui/screens/detay_page.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherProvider? wetProvider;
  ForecastProvider? forecastProvider;
  @override
  void initState() {
    super.initState();
    wetProvider = Provider.of<WeatherProvider>(context, listen: false);
    wetProvider!.getWeatherData();

    forecastProvider = Provider.of<ForecastProvider>(context, listen: false);
    forecastProvider!.getForecastData(context);
  }

  final int index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _customAppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<WeatherProvider>(
              builder: (context, value, child) {
                return value.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : FadeIn(
                        child: Banner(
                          index: index,
                          title: "${value.response.name}",
                          tempture:
                              "${(value.response.main!.temp!.toInt())} \u2103",
                          cityy: value.response.name.toString(),
                          descriptionn:
                              value.response.weather![0].description.toString(),
                          icon: "${value.response.weather![0].icon}",
                        ),
                      );
              },
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Consumer<WeatherProvider>(
                builder: (context, value, child) {
                  return Text(
                    wetProvider!.response.name.toString(),
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Consumer<ForecastProvider>(
              builder: (context, value, child) {
                return value.isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : SizedBox(
                        height: 15.h,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 20),
                          child: ListView.builder(
                            itemCount: value.responsee.list!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return ListWidgett(
                                iconn: (value.responsee.list![index].weather![0]
                                        .icon)
                                    .toString(),
                                temparature:
                                    "${(value.responsee.list![index].main!.temp!.toInt())} \u2103",
                                datatime: value.responsee.list![index].dtTxt
                                    .toString()
                                    .split(" ")
                                    .last
                                    .substring(0, 5),
                              );
                            },
                          ),
                        ),
                      );
              },
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Harian",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 5),
            homeCard(),
            SizedBox(height: 15),
            SizedBox(
              height: 250,
              child: ListView.builder(
                itemCount: locationList.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: _listTileCard(index: index));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

//_listTileCard Widget
class _listTileCard extends StatelessWidget {
  const _listTileCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 20),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0xffD2DFFF),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: ListTile(
          tileColor: Color(0xffD2DFFF),
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Color(0xff9AB6FF),
            child: SvgPicture.asset(
              appAssets.rainn,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    locationList[index].city,
                    textScaleFactor: 1.1,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Hujan petir",
                    textScaleFactor: 1.1,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                  ),
                ],
              ),
              Text(
                locationList[index].temparature,
                textScaleFactor: 1.1,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
              ),
            ],
          ),
          trailing: const Icon(
            Icons.navigate_next_rounded,
            size: 30,
            color: Colors.black,
          ),
          selected: true,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetayPage(
                        index: index,
                      )),
            );
          },
        ),
      ),
    );
  }
}

//HomeCard Widget
class homeCard extends StatelessWidget {
  const homeCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 10.h,
        width: 90.w,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 243, 201, 191),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0xff494343),
              spreadRadius: 0,
              blurRadius: 0.1,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: ClipRRect(
            child: Row(
              children: [
                SizedBox(
                  width: 12.w,
                  height: 12.h,
                  child: SvgPicture.asset(
                    appAssets.warning,
                    color: Colors.red,
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cuaca esok hari kemungkinan\n akan terjadi hujan di siang hari",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Jangan lupa bawa payung ya",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Transform(
                        transform: Matrix4.identity().scaled(4.5)
                          ..translate(2.0, -21),
                        child: SvgPicture.asset(
                          appAssets.warning,
                          color: Color(0xffE7755C),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//ListWidget Container
class ListWidgett extends StatelessWidget {
  const ListWidgett({
    Key? key,
    required this.iconn,
    required this.temparature,
    required this.datatime,
  }) : super(key: key);

  final String iconn;
  final String temparature;
  final String datatime;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 8.h,
            width: 18.w,
            child:
                Image.network("http://openweathermap.org/img/wn/$iconn@2x.png"),
          ),
          Text(
            temparature,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 5),
          Text(
            datatime,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontSize: 11,
                ),
          ),
        ],
      ),
    );
  }
}

//Banner Widget
class Banner extends StatelessWidget {
  const Banner({
    Key? key,
    required this.index,
    required this.title,
    required this.tempture,
    required this.cityy,
    required this.icon,
    required this.descriptionn,
  }) : super(key: key);
  final String title;
  final String tempture;
  final String cityy;
  final String descriptionn;
  final String icon;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 21.h,
        width: 90.w,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          gradient: LinearGradient(
            colors: [
              Color(0xff4F7FFA),
              Color(0xff335FD1),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BounceInDown(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                    ),
                  ),
                  Text(
                    "3.30 PM",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInRightBig(
                    child: SizedBox(
                      width: 15.w,
                      height: 10.h,
                      child: Image.network(
                        "http://openweathermap.org/img/wn/$icon@2x.png",
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeInRightBig(
                          child: Text(
                            tempture,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        FadeInRightBig(
                          child: Text(
                            cityy,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.1,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  children: [
                    Text(
                      descriptionn,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                    ),
                    const SizedBox(width: 5),
                    SvgPicture.asset(appAssets.refresh),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//ApBarr PreferredSizeWidget
class _customAppBar extends StatefulWidget with PreferredSizeWidget {
  String dropdownvalue = 'Tanjungsiang, Subang';
  var items = [
    'Tanjungsiang, Subang',
    '??STANBUL',
    'ANKARA',
    '??ZM??R',
  ];

  @override
  State<_customAppBar> createState() => _customAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class _customAppBarState extends State<_customAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 15),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.place,
                  color: Color(0xff2E3A59),
                ),
                const SizedBox(width: 10),
                _dropDownButton()
              ],
            ),
            const Icon(
              Icons.search,
              color: Color(0xff2E3A59),
            ),
          ],
        ),
      ),
    );
  }

  DropdownButton<String> _dropDownButton() {
    return DropdownButton(
      focusColor: const Color(0xff201C1C),
      value: widget.dropdownvalue,
      icon: const Icon(Icons.keyboard_arrow_down),
      items: widget.items.map((itemss) {
        return DropdownMenuItem(
          value: itemss,
          child: Text(
            itemss,
          ),
        );
      }).toList(),
      onChanged: (String? newValuee) {
        setState(() {
          widget.dropdownvalue = newValuee!;
        });
      },
    );
  }
}
