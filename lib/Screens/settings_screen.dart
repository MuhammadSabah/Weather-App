import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/getX/controller.dart';
import 'package:websafe_svg/websafe_svg.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StateController controller = Get.put(StateController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Settings",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        bottom: PreferredSize(
          child: Container(
            color: Colors.grey,
            height: 1,
          ),
          preferredSize: const Size.fromHeight(1),
        ),
        leading: IconButton(
          splashRadius: 20,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              tileColor: Colors.grey,
              leading: Text(
                'Theme',
                style: Theme.of(context).textTheme.headline1?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              trailing: GestureDetector(
                onTap: () {
                  if (Get.isDarkMode) {
                    Get.changeThemeMode(ThemeMode.light);
                  } else {
                    Get.changeThemeMode(ThemeMode.dark);
                  }
                },
                child: AnimatedCrossFade(
                  crossFadeState: Get.isDarkMode == true
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 300),
                  firstCurve: Curves.decelerate,
                  secondCurve: Curves.easeIn,
                  firstChild: WebsafeSvg.asset(
                    'assets/Sun.svg',
                    color: Colors.white,
                  ),
                  secondChild: WebsafeSvg.asset(
                    'assets/Moon.svg',
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//  Get.isDarkMode == true
//                     ? WebsafeSvg.asset(
//                         'assets/Sun.svg',
//                         color: Colors.white,
//                       )
//                     : WebsafeSvg.asset(
//                         'assets/Moon.svg',
//                         color: Colors.black,
//                       ),