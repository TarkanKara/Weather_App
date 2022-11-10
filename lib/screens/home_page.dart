// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weather_app_ui/core/app_asset.dart';
import 'package:weather_app_ui/models/weather_location.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app_ui/screens/detay_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffE5E5E5),
        appBar: _customAppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            banner(index: index),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Cuaca Per Jam",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 10),
            _listViewWidget(),
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
          tileColor: Color.fromARGB(255, 93, 127, 214),
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
              MaterialPageRoute(builder: (context) => DetayPage()),
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

//ListView Vidget
class _listViewWidget extends StatelessWidget {
  const _listViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15.h,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 20),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: locationList.length,
          itemBuilder: (context, index) {
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
                    child: SvgPicture.asset(locationList[index].iconUrl),
                  ),
                  Text(
                    locationList[index].temparature,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "4.00 PM",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 11,
                        ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

//Banner Widget
class banner extends StatelessWidget {
  const banner({
    Key? key,
    required this.index,
  }) : super(key: key);

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
                  Text(
                    locationList[index].dateTime,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 15,
                          color: Colors.white,
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
                  SizedBox(
                    width: 15.w,
                    height: 10.h,
                    child: SvgPicture.asset(
                      appAssets.rain1,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          locationList[index].temparature,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          locationList[index].city,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.1,
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
                      "Terakhir update 3.00 PM",
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
    'İSTANBUL',
    'ANKARA',
    'İZMİR',
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
