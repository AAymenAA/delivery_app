import 'dart:async';

import 'package:dilevery_app/core/class/status_request.dart';
import 'package:dilevery_app/core/function/handling_data_controller.dart';
import 'package:dilevery_app/core/services/services.dart';
import 'package:dilevery_app/data/datasource/remote/order_details_data.dart';
import 'package:dilevery_app/data/model/orders_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class OrdersDelailsController extends GetxController{

  late TextEditingController codec ;

  late StatusRequest statusRequest ;

  MyServices myServices = Get.find();

  OrderDetailsData orderDetailsData = OrderDetailsData((Get.find()));

  Location location = new Location();
  late OrdersModel ordersModel;

  GoogleMapController? gmc;
  Completer<GoogleMapController>? completercontroller ;

  List<Marker> markers = [];

  double? lat;
  double? long;

  CameraPosition? kGooglePlex;


getLocation()async{


  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData locationData;

  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return;
    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return;
    }
  }
  location.enableBackgroundMode(enable: true);
  location.onLocationChanged.listen((LocationData currentLocation) {
    UpdateLocal(currentLocation.latitude.toString(), currentLocation.longitude.toString());
    markers.add(Marker(markerId: MarkerId("dilevery"),position: LatLng(currentLocation.latitude!, currentLocation.longitude!)));
    gmc!.animateCamera(CameraUpdate.newLatLng(LatLng(currentLocation.latitude!, currentLocation.longitude!)));
    print("${currentLocation.latitude}:${currentLocation.longitude}");
    update();
  });

}


  UpdateLocal(String lat, String long) async{

    statusRequest = StatusRequest.loading;
    var response = await orderDetailsData.updatelocal(
        myServices.sharedPreferences.getString("id")!, lat, long);
    print("=====================Controller $response");
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status'] == "success"){
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }



  intialData(){
    kGooglePlex = CameraPosition(
      target: LatLng(ordersModel.ordersAddresslat!, ordersModel.ordersAddresslanth!),
      zoom: 14.4746,
    );
    markers.add(Marker(markerId: MarkerId("client"),position: LatLng(ordersModel.ordersAddresslat!, ordersModel.ordersAddresslanth!)));
  }

  @override
  void onInit() {
    codec = TextEditingController();
    ordersModel = Get.arguments['ordersmodel'];
    getLocation();
    intialData();
    super.onInit();
  }


  verifyconfirm(int val){
  if(val == codec){
    Get.snackbar("success", "confermed");
  }else{Get.snackbar("filed", "incorrect code");}
  }
}