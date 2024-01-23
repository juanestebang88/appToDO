import 'package:flutter/material.dart';

class TabBarCustom {
  static TabBar tabBar({
    required List<Widget> namePages,
    required TabController tabController}) {
    return TabBar(
      controller: tabController,
      labelColor: Colors.black,
      indicatorColor: Colors.deepPurple,
      indicatorPadding: const EdgeInsets.symmetric(horizontal: 20.0),
      tabs: namePages
    );
  }
  static TabBarView tabBarView(List<Widget> pages, TabController tabController){
    return TabBarView(
      controller: tabController,
      children: pages
    );
  }
}