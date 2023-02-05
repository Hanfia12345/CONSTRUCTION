
import 'dart:convert';

List<VehicleDetail> vehicleDetailFromJson(String str) => List<VehicleDetail>.from(json.decode(str).map((x) => VehicleDetail.fromJson(x)));

String vehicleDetailToJson(List<VehicleDetail> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VehicleDetail {
  VehicleDetail({
    required this.tid,
    required this.tType,
    required this.tNo,
    required this.tFare,
    required this.modelNo,
    required this.tStatus,
  });

  int tid;
  String tType;
  String tNo;
  int tFare;
  String modelNo;
  String tStatus;

  factory VehicleDetail.fromJson(Map<String, dynamic> json) => VehicleDetail(
    tid: json["tid"],
    tType: json["t_type"],
    tNo: json["t_no"],
    tFare: json["t_fare"],
    modelNo: json["model_no"],
    tStatus: json["t_status"],
  );

  Map<String, dynamic> toJson() => {
    "tid": tid,
    "t_type": tType,
    "t_no": tNo,
    "t_fare": tFare,
    "model_no": modelNo,
    "t_status": tStatus,
  };
}

