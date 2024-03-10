class Login_modal {
  int? status;
  Data? data;

  Login_modal({this.status, this.data});

  Login_modal.fromJson(Map<String, dynamic> json) {
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
  String? riderCode;
  String? riderName;
  String? cityCode;

  Body({this.riderCode, this.riderName, this.cityCode});

  Body.fromJson(Map<String, dynamic> json) {
    riderCode = json['rider_code'];
    riderName = json['rider_name'];
    cityCode = json['city_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rider_code'] = this.riderCode;
    data['rider_name'] = this.riderName;
    data['city_code'] = this.cityCode;
    return data;
  }
}