class BidResponseModel {
  bool? status;
  List<Success>? success;

  BidResponseModel({this.status, this.success});

  BidResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['success'] != null) {
      success = <Success>[];
      json['success'].forEach((v) {
        success!.add(Success.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    if (success != null) {
      data['success'] = success!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = {};
    data['_id'] = sId;
    data['userId'] = userId;
    data['location'] = location;
    data['category'] = category;
    data['price'] = price;
    data['quantity'] = quantity;
    data['description'] = description;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
