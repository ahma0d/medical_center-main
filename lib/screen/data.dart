import 'package:dio/dio.dart';

import '../const/token.dart';
import '../model/specific_order_model.dart';
class Data{

  static Future getPrivateOrderId({
    required int id
  }) async {

  SpecificOrderModel?specificOrderModel;
    late Dio dio =Dio();
    print("hello 800");
    dio.options.headers = {"Authorization": token};
    Response response = await dio.get(
      "http://192.168.202.254:7000/api/company/order/product-order/display-order",
      data: {
        "orderId": id ,
      },
    );
    specificOrderModel = SpecificOrderModel.fromJson(response.data['order']);
    print("hello 5");
    print(specificOrderModel! .totalPrice);
  }

}