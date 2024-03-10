class Undelevired {
  int? status;
  Data? data;

  Undelevired({this.status, this.data});

  Undelevired.fromJson(Map<String, dynamic> json) {
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
  String? deliveryStatusCode;
  String? deliveryStatusDetail;

  Body({this.deliveryStatusCode, this.deliveryStatusDetail});

  Body.fromJson(Map<String, dynamic> json) {
    deliveryStatusCode = json['delivery_status_code'];
    deliveryStatusDetail = json['delivery_status_detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['delivery_status_code'] = this.deliveryStatusCode;
    data['delivery_status_detail'] = this.deliveryStatusDetail;
    return data;
  }
}