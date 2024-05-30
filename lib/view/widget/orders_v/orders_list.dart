
import 'package:dilevery_app/controller/orders_controller.dart';
import 'package:dilevery_app/data/model/orders_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class OrdersList extends GetView<OrdersController> {
  const OrdersList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersController>(builder: (controller) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: MediaQuery.of(context).size.height-100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        color: Colors.grey[200],
      ),
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        separatorBuilder: (context, index) => const SizedBox(height: 20,),
        itemCount: controller.orderslist.length,
        itemBuilder: (context, index){
          return OrderCard(ordersModel: OrdersModel.fromJson(controller.orderslist[index]));
        },),
    ));
  }
}

class OrderCard extends GetView<OrdersController> {
  const OrderCard( {
    super.key,
    required this.ordersModel,
  });
  final OrdersModel ordersModel;


  @override
  Widget build(BuildContext context) {

    return Card(
        shape: RoundedRectangleBorder(
          borderRadius:  BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Order Number: ${ordersModel.ordersId}"),
                  Spacer(),
                  Text("${Jiffy.parse(ordersModel.ordersDatetime!).fromNow()}")
                ],
              ),
              Text("Order Pric: ${ordersModel.ordersPrice}"),
              Text("Delivery Price: ${ordersModel.ordersPricedelivery}"),
              Text("Payment Method: ${ordersModel.ordersPymenttype}"),
              Container(
                height: 2,
                color: Colors.grey,
              ),
              Row(
                children: [
                  Text("Totel Price: 100£"),
                  Spacer(),
                  ElevatedButton(onPressed: (){
                   controller.toDetails(ordersModel);
                  }, child: Text("Details")),
                ],
              ),
            ],
          ),
        )
    );
  }
}