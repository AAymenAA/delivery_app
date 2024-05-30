import 'package:dilevery_app/core/class/status_request.dart';
import 'package:dilevery_app/core/constant/routes.dart';
import 'package:dilevery_app/core/function/handling_data_controller.dart';
import 'package:dilevery_app/core/services/services.dart';
import 'package:dilevery_app/data/datasource/remote/orders_data.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController{


  late StatusRequest statusRequest ;
  MyServices myServices = Get.find();
  OrdersData ordersData = OrdersData(Get.find());
  String statorder = "2";
  List orderslist = [];

  @override
  getdata(shopid, statorder, dileveryid) async{
    orderslist.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.getData(shopid, statorder, dileveryid);
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status'] == "success"){
        orderslist.addAll(response['data']);
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  toPanding() {
    statorder = "2";
    getdata("0", statorder, "2");
    update();

  }

  @override
  toSelected() {
    statorder = "3";
    getdata(myServices.sharedPreferences.getString("id")!, statorder ,"2");
    update();

  }



  @override
  toComplet() {
    statorder = "4";
    getdata(myServices.sharedPreferences.getString("id")!, statorder, "2");
    update();

  }

  toDetails(listdata){
      Get.toNamed(AppRoute.OrdersDetails, arguments: {"ordersmodel": listdata});
  }

  void onInit() {
    getdata("0", statorder, "2");
    super.onInit();
  }




}