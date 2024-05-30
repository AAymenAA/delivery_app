import 'package:dilevery_app/core/class/crud.dart';
import 'package:dilevery_app/link_api.dart';

class TestData {

  Crud crud ;

  TestData(this.crud);

  getData()async{
    var response = await  crud.postData(AppLink.test, {});
    return response.fold((l) => l, (r) => r);
  }

}