import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ThemeListTile extends StatelessWidget {
  const ThemeListTile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      tileColor: Colors.grey,
      leading: Text(
        Get.isDarkMode == true ? 'Light' : 'Dark',
        style: Theme.of(context).textTheme.headline1?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 0,
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
    );
  }
}
