import 'package:dilevery_app/core/class/crud.dart';
import 'package:dilevery_app/link_api.dart';

class OrdersData {

  Crud crud ;

  OrdersData(this.crud);

  getData(String dileveryid, String statorder, String shopid)async{
    var response = await  crud.postData(AppLink.ordersview, {"shopid": shopid,"dileveryid": dileveryid,"statorder":statorder});
    return response.fold((l) => l, (r) => r);
  }


}