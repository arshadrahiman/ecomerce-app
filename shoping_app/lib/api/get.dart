// To parse this JSON data, do
//
    // final getData = getDataFromJson(jsonString);

import 'dart:convert';

GetData getDataFromJson(String str) => GetData.fromJson(json.decode(str));

String getDataToJson(GetData data) => json.encode(data.toJson());

class GetData {
    GetData({
        this.productDetails,
        this.status,
        this.message,
    });

    List<ProductDetail> ?productDetails;
    int? status;
    String? message;

    factory GetData.fromJson(Map<String, dynamic> json) => GetData(
        productDetails: List<ProductDetail>.from(json["productDetails"].map((x) => ProductDetail.fromJson(x))),
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "productDetails": List<dynamic>.from(productDetails!.map((x) => x.toJson())),
        "status": status,
        "message": message,
    };
}

class ProductDetail {
    ProductDetail({
        this.productId,
        this.productName,
        this.productCode,
        this.productPrice,
        this.productPriceOffer,
        this.productBaseImage,
        this.categoryName,
        this.categoryId,
    });

    int? productId;
    String? productName;
    String? productCode;
    String? productPrice;
    String? productPriceOffer;
    String? productBaseImage;
    String? categoryName;
    String? categoryId;

    factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
        productId: json["product_id"],
        productName: json["product_name"],
        productCode: json["product_code"],
        productPrice: json["product_price"],
        productPriceOffer: json["product_price_offer"],
        productBaseImage: json["product_base_image"],
        categoryName: json["category_name"],
        categoryId: json["category_id"],
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "product_code": productCode,
        "product_price": productPrice,
        "product_price_offer": productPriceOffer,
        "product_base_image": productBaseImage,
        "category_name": categoryName,
        "category_id": categoryId,
    };
}
