class OrdersModel {
  final int id;
  final int totalPrice;
  final bool type;
  final int orderNumber;
  final String createIt;
  final CompanyOrderModel companyOrderModel;
  OrdersModel({
    required this.id,
    required this.totalPrice,
    required this.type,
    required  this.orderNumber,
    required this.createIt,
    required this.companyOrderModel,
  });

  factory OrdersModel.fromJson(Map<String, dynamic> json) {
    return OrdersModel(
      id: json['id'],
      totalPrice: json['total_price'],
      type: json['type'],
      orderNumber: json['order_number'],
      createIt: json['createdAt'],
      companyOrderModel: CompanyOrderModel.fromJson(json['company']),
    );
  }
}

class CompanyOrderModel {
  final String name;
  final String image;
  CompanyOrderModel({
    required this.name,
    required this.image,
  });

  factory CompanyOrderModel.fromJson(Map<String, dynamic> json) {
    return CompanyOrderModel(
      name: json['name'],
      image: json['image_url'],
    );
  }
}
