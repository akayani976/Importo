class BidResponseModel {
  bool? status;
  List<Success>? success;

  BidResponseModel({this.status, this.success});

  BidResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['success'] != null) {
      success = <Success>[];
      json['success'].forEach((v) {
        success!.add(new Success.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.success != null) {
      data['success'] = this.success!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Success {
  String? sId;
  String? userId;
  String? location;
  String? category;
  int? price;
  int? quantity;
  String? description;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Success(
      {this.sId,
      this.userId,
      this.location,
      this.category,
      this.price,
      this.quantity,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Success.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    location = json['location'];
    category = json['category'];
    price = json['price'];
    quantity = json['quantity'];
    description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['location'] = this.location;
    data['category'] = this.category;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['description'] = this.description;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
