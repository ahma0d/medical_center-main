// import 'package:flutter/material.dart';
//
// class OrderPrivateCompany extends StatelessWidget {
//   const OrderPrivateCompany({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             Container(
//               height: 200,
//               color: Colors.red,
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       // the image will be image medicine
//                       const Image(
//                         image: AssetImage('assets/images/1.png'),
//                         height: 200,
//                         width: 120,
//                       ),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children:  [
//                             Text("Acetaminophen"),
//                             Row(
//                               children:  [
//                                 Text("Barcode Medicine "),
//                                 Text(" 60544"),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Text("Price on piece "),
//                                 Text("60"),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Text("Quantity"),
//                                 Text("3"),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Text("Total Price is : "),
//                                 Text("6000"),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/const/token.dart';
import 'package:untitled2/model/all_orders_model.dart';

import '../model/specific_order_model.dart';
import 'data.dart';

class CartScreen extends StatelessWidget {
   CartScreen({Key? key,  this.specificOrderModel , required this.id}) : super(key: key);
   final int id ;
   SpecificOrderModel? specificOrderModel;
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

   @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPrivateOrderId(id: id),
       builder: (context,snapshot){
        return  Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: NormalText(
              text: "Details Order",
              sizeText: 20.0,
              fontWeight: FontWeight.w700,
              colorText: Colors.white,
            ),
          ),
          body: Column(
            children: [
              Container(
                height: 490,
                child: ListView.separated(
                  itemBuilder: (context, index) => const OneItemCart(),
                  separatorBuilder: (context, index) => const Divider(
                    thickness: 1.5,
                  ),
                  itemCount: 3,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              NormalText(
                text: "Order ",
                sizeText: 20.0,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(
                height: 20.0,
              ),
              AfterCart(textRight: "", textLeft: "Order Number"),
              const SizedBox(
                height: 10.0,
              ),
              AfterCart(textRight: "", textLeft: "type"),
              const SizedBox(
                height: 10.0,
              ),
              AfterCart(textRight: "Noor", textLeft: "Company"),
              const SizedBox(
                height: 10.0,
              ),
              AfterCart(
                textRight: "1000",
                textLeft: "total Price Order",
                leftText: Colors.black,
                rightText: Colors.black,
              ),
              const Spacer(),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: BasicBottom(
              //     text: "Pay Now",
              //     colorText: Colors.white,
              //     fontWeight: FontWeight.w700,
              //     sizeText: 20.0,
              //     onPressed: () {},
              //   ),
              // ),
              const SizedBox(
                height: 6.0,
              ),
            ],
          ),
        );
       },
    );
  }
}

class OneItemCart extends StatelessWidget {
  const OneItemCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      height: 152,
      color: Colors.white,
      child: Row(
        children: [
          const Image(
            image: AssetImage('assets/images/1.png'),
            height: 80,
          ),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 6.0,
                ),
                NormalText(
                  text: "Vitamin Vitamin Vitamin Vitamin Vitamin",
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 10,
                ),
                NormalText(
                  text: "Price  " "  8000",
                  fontWeight: FontWeight.w600,
                  colorText: Colors.grey,
                  sizeText: 14,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                NormalText(
                  text: "quantity  " "  4",
                  fontWeight: FontWeight.w500,
                  colorText: Colors.grey,
                  sizeText: 14,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                NormalText(
                  text: "total price " "10000",
                  fontWeight: FontWeight.w500,
                  colorText: Colors.grey,
                  sizeText: 14,
                ),
                const SizedBox(
                  height: 10,
                ),
                NormalText(
                  text: "94525LBLWC" "  Barcode Product",
                  sizeText: 12,
                ),
                const SizedBox(
                  height: 10,
                ),
                NormalText(
                  text: "Expiration Date " "  2024-06-05T21:00:00.000Z",
                  sizeText: 12,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class NormalText extends StatelessWidget {
  final String text;
  Color colorText;
  TextOverflow textOverflow;

  double sizeText;
  double heightText;

  double letterSpacing;

  FontWeight fontWeight;
  int maxLine;

  NormalText({
    super.key,
    required this.text,
    this.colorText = Colors.black,
    this.textOverflow = TextOverflow.ellipsis,
    this.sizeText = 16.0,
    this.heightText = 0.0,
    this.letterSpacing = 0.0,
    this.fontWeight = FontWeight.w400,
    this.maxLine = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      maxLines: maxLine,
      style: TextStyle(
        height: heightText,
        letterSpacing: letterSpacing,
        color: colorText,
        fontSize: sizeText,
        fontWeight: fontWeight,
      ),
    );
  }
}

class AfterCart extends StatelessWidget {
  final String textRight;

  final String textLeft;
  Color rightText;

  Color leftText;

  AfterCart({
    super.key,
    required this.textRight,
    required this.textLeft,
    this.rightText = Colors.grey,
    this.leftText = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          NormalText(
            text: textLeft,
            colorText: leftText,
          ),
          Spacer(),
          NormalText(
            text: textRight,
            colorText: rightText,
          )
        ],
      ),
    );
  }
}

class OneItemOrd extends StatelessWidget {
  final OrdersModel model;

  const OneItemOrd({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      decoration: BoxDecoration(
        //color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8.0),
      ),
      width: double.infinity,
      height: 200,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                image: AssetImage('assets/images/1.png'),
                width: 130.0,
                height: 140.0,
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NormalText(
                  text: " Order Number :  ${model.orderNumber}",
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                NormalText(
                  text: "Name Company : ${model.companyOrderModel.name}",
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    NormalText(
                      text: "Order Id : ",
                      fontWeight: FontWeight.w800,
                    ),
                    NormalText(
                      text: model.id.toString(),
                      colorText: Colors.grey,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    NormalText(
                      text: "Total Price : ",
                      fontWeight: FontWeight.w800,
                    ),
                    NormalText(
                      text: "${model.totalPrice} s.y",
                      colorText: Colors.grey,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                NormalText(
                  text: model.createIt,
                  sizeText: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 12.0,
                    ),
                    // BasicBottom(
                    //   height: 20.0,
                    //   width: 20.0,
                    //   borderRadius: 8.0,
                    //   colorContainer: Colors.red,
                    //   text: "Delete",
                    //   onPressed: () {},
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AllOrders extends StatelessWidget {
  late Dio dio = Dio();

    SpecificOrderModel? specificOrderModel;
  @override
  Widget build(BuildContext context) {
    List<OrdersModel> list = [];
    Future getAllCompanyOrder() async {
      print("hello 1");
      dio.options.headers = {"Authorization": token};
      Response response = await dio
          .get("http://192.168.202.254:7000/api/company/order/display-all");
      response.data['orders'].forEach((element) {
        list.add(OrdersModel.fromJson(element));
      });
      print(list[0].createIt);
    }

    Future getPrivateOrderId({
      required int id
    }) async {
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        title: NormalText(
          text: "All Order Pharmacy",
          colorText: Colors.white,
          fontWeight: FontWeight.bold,
          sizeText: 20.0,
        ),
        actions: [
          // DefaultIconButton(
          //   iconData: Icons.search,
          //   onPressed: () {},
          // ),
          IconButton(
            onPressed: () {
              getPrivateOrderId(id: 1);
            },
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 50.0,
              width: double.infinity,
              color: Colors.red,
              child: Container(
                width: 400,
                margin: const EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                child: TabBar(
                  unselectedLabelColor: const Color(0xff8E90C7),
                  physics: const BouncingScrollPhysics(),
                  indicator: const BoxDecoration(
                    color: Colors.white,
                  ),
                  dividerColor: Colors.red,
                  tabs: [
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: NormalText(
                          text: "Company",
                          colorText: Colors.black87,
                          sizeText: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Tab(
                      child: Align(
                          alignment: Alignment.center,
                          child: NormalText(
                            text: "Laboratory",
                            sizeText: 16.0,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  FutureBuilder(
                    future: getAllCompanyOrder(),
                    builder: (context, snapshot) {
                      return ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            getPrivateOrderId(id: list[index].id);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CartScreen(id:list[index].id ,)));
                          },
                          child: OneItemOrd(
                            model: list[index],
                          ),
                        ),
                        separatorBuilder: (context, index) => const Divider(
                          thickness: 1.5,
                        ),
                        itemCount: list.length,
                      );
                    },
                  ),
                  ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CartScreen(id: 1,)));
                      },
                      child: OneItemOrd(
                        model: list[index],
                      ),
                    ),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: list.length,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
