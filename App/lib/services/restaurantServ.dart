import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotshot/model/restInfo.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../constants/error_handling.dart';
import '../constants/globvar.dart';

class RestaurantServ{
  Future<List<RestInfo>> fetchAllRestaurants(BuildContext context) async {
    // final userProvider = Provider.of(context)
    List<RestInfo> RestList = [];
    try {
      http.Response res =
      await http.get(Uri.parse('http://10.0.2.2:8080/food/rest'));
      var obj=jsonDecode(res.body);
      print(obj[0].runtimeType);
      print(obj);
      print(res.body);
      print(res.body.runtimeType);
      print(res.body.length);
      print("hi1");
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < obj.length; i++) {
            // var obj=;
            RestList.add(
              RestInfo.fromJson(obj[i])
            );
          }
          print(RestList);
          print("hi");
        },
      );
    } catch (e) {
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      print(e);
      print("alpha");
      // showSnackBar(BuildContext, e.toString());
    }
    return RestList;
  }
  }