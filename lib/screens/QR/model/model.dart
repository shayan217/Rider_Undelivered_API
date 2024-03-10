class LoadsheetModal {
  int? status;
  Data? data;
  LoadsheetModal({this.status, this.data});
  LoadsheetModal.fromJson(Map<String, dynamic> json) {
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
  List<Body>? body;
  String? message;
  Data({this.response, this.body, this.message});
  Data.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    if (json['body'] != null) {
      body = <Body>[];
      json['body'].forEach((v) {
        body!.add(new Body.fromJson(v));
      });
    }
    message = json['message'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    if (this.body != null) {
      data['body'] = this.body!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}
class Body {
  String? masterNo;
  String? shipmentNo;
  String? shipmentDate;
  String? consigneeName;
  String? consigneeAddress;
  String? cashCollect;
  String? consigneeContact;
  String? accountNumber;
  Body(
      {this.masterNo,
      this.shipmentNo,
      this.shipmentDate,
      this.consigneeName,
      this.consigneeAddress,
      this.cashCollect,
      this.consigneeContact,
      this.accountNumber});
  Body.fromJson(Map<String, dynamic> json) {
    masterNo = json['master_no'];
    shipmentNo = json['shipment_no'];
    shipmentDate = json['shipment_date'];
    consigneeName = json['consignee_name'];
    consigneeAddress = json['consignee_address'];
    cashCollect = json['cash_collect'];
    consigneeContact = json['consignee_contact'];
    accountNumber = json['account_number'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['master_no'] = this.masterNo;
    data['shipment_no'] = this.shipmentNo;
    data['shipment_date'] = this.shipmentDate;
    data['consignee_name'] = this.consigneeName;
    data['consignee_address'] = this.consigneeAddress;
    data['cash_collect'] = this.cashCollect;
    data['consignee_contact'] = this.consigneeContact;
    data['account_number'] = this.accountNumber;
    return data;
  }
}