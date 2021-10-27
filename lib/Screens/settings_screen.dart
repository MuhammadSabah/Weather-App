import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            color: Colors.grey.shade600,
            height: 2,
          ),
          preferredSize: const Size.fromHeight(2),
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
        child: Container(),
      ),
    );
  }
}
