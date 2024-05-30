import 'package:dilevery_app/core/class/crud.dart';
import 'package:dilevery_app/link_api.dart';

class OrderDetailsData {

  Crud crud ;

  OrderDetailsData(this.crud);

  updatelocal(String dileveryid, String lat, String long) async {
    var response = await crud.postData(AppLink.updatelocal, {
      "dileveryid": dileveryid,
      "lat": lat,
      "long": long,
    });
    return response.fold((l) => l, (r) => r);
  }

}