// To parse this JSON data, do
//
//     final reponseLogin = reponseLoginFromJson(jsonString);

import 'dart:convert';

ResponseLogin reponseLoginFromJson(String str) =>
    ResponseLogin.fromJson(json.decode(str));

String reponseLoginToJson(ResponseLogin data) => json.encode(data.toJson());

class ResponseLogin {
  ResponseLogin({
    required this.stores,
    required this.status,
    required this.message,
  });

  List<Store> stores;
  String status;
  String message;

  factory ResponseLogin.fromJson(Map<String, dynamic> json) => ResponseLogin(
        stores: List<Store>.from(json["stores"].map((x) => Store.fromJson(x))),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "stores": List<dynamic>.from(stores.map((x) => x.toJson())),
        "status": status,
        "message": message,
      };
}

class Store {
  Store({
    required this.storeId,
    required this.storeCode,
    required this.storeName,
    required this.address,
    required this.dcId,
    required this.dcName,
    required this.accountId,
    required this.accountName,
    required this.subchannelId,
    required this.subchannelName,
    required this.channelId,
    required this.channelName,
    required this.areaId,
    required this.areaName,
    required this.regionId,
    required this.regionName,
    required this.latitude,
    required this.longitude,
  });

  String storeId;
  String storeCode;
  String storeName;
  String address;
  String dcId;
  String dcName;
  String accountId;
  String accountName;
  String subchannelId;
  String subchannelName;
  String channelId;
  String channelName;
  String areaId;
  String areaName;
  String regionId;
  String regionName;
  String latitude;
  String longitude;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        storeId: json["store_id"],
        storeCode: json["store_code"],
        storeName: json["store_name"],
        address: json["address"],
        dcId: json["dc_id"],
        dcName: json["dc_name"],
        accountId: json["account_id"],
        accountName: json["account_name"],
        subchannelId: json["subchannel_id"],
        subchannelName: json["subchannel_name"],
        channelId: json["channel_id"],
        channelName: json["channel_name"],
        areaId: json["area_id"],
        areaName: json["area_name"],
        regionId: json["region_id"],
        regionName: json["region_name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "store_id": storeId,
        "store_code": storeCode,
        "store_name": storeName,
        "address": address,
        "dc_id": dcId,
        "dc_name": dcName,
        "account_id": accountId,
        "account_name": accountName,
        "subchannel_id": subchannelId,
        "subchannel_name": subchannelName,
        "channel_id": channelId,
        "channel_name": channelName,
        "area_id": areaId,
        "area_name": areaName,
        "region_id": regionId,
        "region_name": regionName,
        "latitude": latitude,
        "longitude": longitude,
      };
}
