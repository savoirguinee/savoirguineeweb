import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:json_annotation/json_annotation.dart';
//import 'package:intl/intl.dart';

class ConfigService with ChangeNotifier {
  bool _night = false;
  bool _auth_egg = false;
  bool _dev_mode = false;
  Box box;
  //box = Hive.box('config');

  ConfigService() {
    getDark();
  }

  bool get getNight => _night;
  bool get authEgg => _auth_egg;

  bool get isHuman => !_dev_mode;

  set setNight(bool val) {
    _night = val;
    notifyListeners();
  }

  void devMode() {
    _dev_mode = true;
    notifyListeners();
  }

  void humanMode() {
    _dev_mode = false;
    notifyListeners();
  }

  Future night() async {
    setNight = true;
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.setBool("isDark", true);
  }

  Future day() async {
    setNight = false;
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.setBool("isDark", false);
  }

  Future<void> getDark() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.getBool("isDark") != null ?
    // prefs.getBool("isDark") ? night(): day()
    // :day();
  }
}
