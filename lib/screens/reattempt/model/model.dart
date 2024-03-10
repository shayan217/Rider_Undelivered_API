class ReattemptModel {
  int? status;
  Data? data;
  ReattemptModel({this.status, this.data});
  ReattemptModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
class Data {
  int? response;
  String? message;
  List<Body>? body;
  Data({this.response, this.message, this.body});
  Data.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    message = json['message'];
    if (json['body'] != null) {
      body = <Body>[];
      json['body'].forEach((v) {
        body!.add(new Body.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    data['message'] = this.message;
    if (this.body != null) {
      data['body'] = this.body!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class Body {
  String? shipmentNo;
  String? consigneeName;
  String? consigneeAddress;
  String? deliverySheet;
  String? cashCollect;
  String? consigneeContact;
  String? deliveryStatusCode;
  String? deliveryStatusDetail;
  String? deliveryDate;
  Body(
      {this.shipmentNo,
      this.consigneeName,
      this.consigneeAddress,
      this.deliverySheet,
      this.cashCollect,
      this.consigneeContact,
      this.deliveryStatusCode,
      this.deliveryStatusDetail,
      this.deliveryDate});
  Body.fromJson(Map<String, dynamic> json) {
    shipmentNo = json['shipment_no'];
    consigneeName = json['consignee_name'];
    consigneeAddress = json['consignee_address'];
    deliverySheet = json['delivery_sheet'];
    cashCollect = json['cash_collect'];
    consigneeContact = json['consignee_contact'];
    deliveryStatusCode = json['delivery_status_code'];
    deliveryStatusDetail = json['delivery_status_detail'];
    deliveryDate = json['delivery_date'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shipment_no'] = this.shipmentNo;
    data['consignee_name'] = this.consigneeName;
    data['consignee_address'] = this.consigneeAddress;
    data['delivery_sheet'] = this.deliverySheet;
    data['cash_collect'] = this.cashCollect;
    data['consignee_contact'] = this.consigneeContact;
    data['delivery_status_code'] = this.deliveryStatusCode;
    data['delivery_status_detail'] = this.deliveryStatusDetail;
    data['delivery_date'] = this.deliveryDate;
    return data;
  }
}