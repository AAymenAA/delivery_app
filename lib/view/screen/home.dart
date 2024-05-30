
import 'package:dilevery_app/controller/orders_controller.dart';
import 'package:dilevery_app/core/constant/colors.dart';
import 'package:dilevery_app/view/widget/orders_v/orders_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersController controller = Get.put(OrdersController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("mega shop")),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: Text("Orders wating dilevery"),
                onTap: (){controller.toPanding();},
              ),
              ListTile(
                title: Text("Selected Order"),
                onTap: (){controller.toSelected();},
              ),
              ListTile(
                title: Text("Orders Completed"),
                onTap: (){controller.toComplet();},
              ),
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: OrdersList(),
        ),
      ),
    );
  }
}













