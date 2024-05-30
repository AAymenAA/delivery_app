
import 'package:dilevery_app/controller/orders_details_controller.dart';
import 'package:dilevery_app/core/constant/colors.dart';
import 'package:dilevery_app/core/function/valide_input.dart';
import 'package:dilevery_app/core/shared/customformfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(OrdersDelailsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Details"),
      ),
      body: GetBuilder<OrdersDelailsController>(
    builder: (controller)=>Container(
        height: Get.height-50,
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 20 ,left: 20,right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: GoogleMap(
                  mapType: MapType.terrain,
                  markers: controller.markers.toSet(),
                  initialCameraPosition: controller.kGooglePlex!,
                  onMapCreated: (GoogleMapController controllermap) {
                    controller.gmc = controllermap;
                    controller.completercontroller!.complete(controllermap);
                  },
                ),

              ),
            ),
            SizedBox(height: 10,),

            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 20,left: 20,right: 20, bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Text("Client Name: ${controller.ordersModel.ordersClientname}"),
                    Spacer(),
                    Row(
                      children: [
                        ElevatedButton(onPressed: (){
                          showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                              ),
                              builder: (context) => Container(
                                height: 300,
                                width: Get.width,
                                child: Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Column(
                                    children: [
                                      CustomFormField(hint: "The code", label: "Code", icon: Icons.password, controller: controller.codec, valid: (val){return valideInput(val!, 10, 30, 'phone');}),
                                      SizedBox(height: 40,),
                                      ElevatedButton(onPressed: (){controller.verifyconfirm(controller.ordersModel.ordersPrice!);}, child: Text("confirme",style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(backgroundColor: KMainColor,),),
                                    ],
                                  ),
                                ),
                              )

                          );
                        }, child: Text("confirme delivery")),
                        Spacer(),
                        ElevatedButton(onPressed: (){}, child: Text("Call Client")),
                      ],
                    )
                  ],
                ),

              ),
            )
          ],
        ),
      ),)
    );
  }
}