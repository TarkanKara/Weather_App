// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:weather_app_ui/core/app_asset.dart';
import 'package:weather_app_ui/models/weather_location.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app_ui/screens/home_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DetayPage extends StatefulWidget {
  const DetayPage({super.key});

  @override
  State<DetayPage> createState() => _DetayPageState();
}

class _DetayPageState extends State<DetayPage> {
  final int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      body: Column(
        children: [
          barWidget(index: index),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 15),
                  child: Text(
                    "Cuaca Per Jam",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                const SizedBox(height: 10),
                const listViewWidget(),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Detail Informasi",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Center(
                  heightFactor: 1.1,
                  child: Container(
                    height: 12.h,
                    width: 92.w,
                    decoration: const BoxDecoration(
                        color: Color(0XFFFAFAFA),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: Row(
                        children: [
                          Stack(
                            children: const [
                              CircularProgressIndicator(
                                value: .2,
                                backgroundColor: Color(0xffE4E4E4),
                                color: Color(0xff2AA837),
                                strokeWidth: 4,
                              ),
                              Positioned(
                                left: 10,
                                top: 10,
                                child: Text("12"),
                              ),
                            ],
                          ),
                          const SizedBox(width: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "AQI - Sangat Baik",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Kualitas udara di daerahmu untuk saat ini\n sangat baik. Tidak ada pencemaran udara\n yang menyebabkan berbagai penyakit.",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontSize: 1.8.h,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//barWidget
class barWidget extends StatelessWidget {
  const barWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff4F80FA),
            Color(0xff335FD1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 20,
                ),
                Text(
                  locationList[index].city,
                  textScaleFactor: 1.1,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white,
                        letterSpacing: 1,
                      ),
                ),
                const Icon(
                  Icons.more_horiz_sharp,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
            SizedBox(height: 3.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  locationList[index].dateTime,
                  textScaleFactor: 1.1,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white,
                        letterSpacing: 1,
                      ),
                ),
                const SizedBox(width: 10),
                Text(
                  "3.30 PM",
                  textScaleFactor: 1.1,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white,
                        letterSpacing: 1,
                      ),
                ),
              ],
            ),
            SvgPicture.asset(
              appAssets.rainn,
              fit: BoxFit.cover,
              height: 130,
              width: 150,
            ),
            Text(
              locationList[index].temparature,
              textScaleFactor: 1.1,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white,
                  ),
            ),
            SizedBox(height: 1.h),
            Text(
              locationList[index].city,
              textScaleFactor: 1.1,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    fontSize: 20,
                    color: Colors.white,
                  ),
            ),
            SizedBox(height: 1.5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
          ],
        ),
      ),
    );
  }
}
