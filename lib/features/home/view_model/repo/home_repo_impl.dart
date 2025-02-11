// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:tamayz/modules/Home/view_model/repo/home_repo.dart';
// import 'package:tamayz/shared/constants.dart';
// import 'package:tamayz/shared/models/default_model.dart';
// import 'package:tamayz/shared/network_helper.dart';
//
// class HomeRepoImpl implements HomeRepo {
//   @override
//   Future<DefaultModel?> getAllEvents({required BuildContext context}) async {
//     return await ApiService.api(
//         endPoint: GETALLEVENT, requestType: RequestType.get, context: context);
//   }
//
//   @override
//   Future<DefaultModel?> getSingle(
//       {required BuildContext context, required int id}) async {
//     return await ApiService.api(
//         queryParamters: {'id': id},
//         endPoint: SINGLE,
//         requestType: RequestType.get,
//         context: context);
//   }
//
//   @override
//   Future<DefaultModel?> getTopCoupons({required BuildContext context}) async {
//     return await ApiService.api(
//         endPoint: GETTOPCOUPONS,
//         requestType: RequestType.get,
//         context: context);
//   }
//
//   @override
//   collectDailyPoints(context) {
//     return ApiService.api(
//         endPoint: COLLECTDAILYPOINTS,
//         requestType: RequestType.post,
//         options: Options(
//           headers: {
//             'token': token,
//           },
//         ),
//         context: context);
//   }
//
//   @override
//   getDailyBounus(context) {
//     return ApiService.api(
//         endPoint: GETDAILYBOUNUS,
//         requestType: RequestType.get,
//         context: context);
//   }
//
//   @override
//   getSlider(context) async {
//     return await ApiService.api(
//         endPoint: SLIDER, requestType: RequestType.get, context: context);
//   }
//
//   @override
//   getCustomPoints(context) async {
//     return await ApiService.api(
//         endPoint: GETCUSTOMPOINTS,
//         requestType: RequestType.get,
//         context: context,
//         options: Options(
//           headers: {
//             'token': token,
//           },
//         ),
//     );
//   }
//
//   @override
//   collectCustomPoints(context, {required pointId}) {
//     return ApiService.api(
//         endPoint: COLLECTCUSTOM,
//         requestType: RequestType.post,
//         options: Options(
//           headers: {
//             'token': token,
//           },
//         ),
//         context: context,
//       queryParamters: {
//           "point_id":pointId
//       }
//     );
//   }
// }
