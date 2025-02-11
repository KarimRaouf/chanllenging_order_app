// import 'dart:async';
// import 'dart:developer';
//
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tamayz/modules/Home/models/collected_daily_points_model.dart';
// import 'package:tamayz/modules/Home/models/get_custom_points_model.dart';
// import 'package:tamayz/modules/Home/models/get_event_model/get_event_model.dart';
//
// import 'package:tamayz/modules/Home/models/single_model/single_model.dart';
// import 'package:tamayz/modules/Home/models/slider_model.dart';
// import 'package:tamayz/modules/Home/models/top_counpons_model/top_counpons_model.dart';
// import 'package:tamayz/modules/Home/view_model/cubit/home_state.dart';
// import 'package:tamayz/modules/Home/view_model/repo/home_repo.dart';
// import 'package:tamayz/modules/Home/views/widgets/custom_point_popup.dart';
// import 'package:tamayz/modules/Home/views/widgets/daily_points_popup.dart';
// import 'package:tamayz/shared/constants.dart';
// import 'package:tamayz/shared/models/default_model.dart';
//
// import '../../models/Daily_bounus_model.dart';
// import '../../views/widgets/daily_points_handle.dart';
// import 'package:tamayz/modules/Home/view_model/repo/home_repo_impl.dart';
//
// class HomeCubit extends Cubit<HomeState> {
//   HomeCubit(context) : super(HomeInitial()) {
//     if (userModel.user?.type != guestWithoutAccountUser &&
//         userModel.user?.type != registerOnlyUser) {
//       getCustomPoints(context);
//       getDailyBounus(context);
//     }
//     getAllEventCubit(context: context);
//     // getSingleCubit(context: context, id: 1);
//     getTopCouponsCubit(context: context);
//     getSlider(context);
//   }
//
//   static HomeCubit get(BuildContext context) => BlocProvider.of(context);
//
//   String formatEndDate(String? endDate) {
//     if (endDate == null || endDate.isEmpty) return '';
//     DateTime parsedDate = DateTime.parse(endDate);
//     var formatter = DateFormat.yMMMMd('ar');
//     return formatter.format(parsedDate);
//   }
//
//   List<bool> userExperienceExpanded = [
//     false,
//     false,
//     false,
//     false,
//     false,
//   ];
//
//   void changeUserExperienceExpandState(int index) {
//     userExperienceExpanded[index] = !userExperienceExpanded[index];
//     emit(ChangeUserExperienceExpandState());
//   }
//
// /////////////////////// collect daily points logic ////////////////////////////////////
//
//   final HomeRepo homeRepo = HomeRepoImpl();
//
//   late CollectedDailyPointsModel collectedDailyPointsModel;
//
//   collectDailyPoints(context) async {
//     emit(DailyPointsCollectedLoading());
//
//     DefaultModel response = await homeRepo.collectDailyPoints(context);
//     print('Response received: ${response.status}');
//     if (response.status!) {
//     collectedDailyPointsModel=  CollectedDailyPointsModel.fromJson(response.data);
//       print('Daily points collected: ${collectedDailyPointsModel.points}');
//       print(response.data);
//       emit(DailyPointsCollectedSuccessfully());
//       await DailyPointsHandel.saveLastCollectionDateDailyPoints();
//     } else {
//       emit(DailyPointsCollectedError());
//       print('Error: ${response.errors}');
//     }
//     return response.status;
//   }
//
// // get daily points logic
//
//   Future<void> checkForDailyPoints(BuildContext context) async {
//     print("Checking for daily points...");
//     if (await DailyPointsHandel.shouldShowDailyPointsPopup()) {
//       print("Showing daily points popup...");
//       showDailyPointsPopup(
//         context,
//       );
//     } else {
//       print("You took your daily points before");
//     }
//   }
//
//   void showDailyPointsPopup(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return DailyPointsPopup(
//           numOfPoints: getDailyBounusModel.numOfPoints ?? 0,
//           onCollect: () async {
//             await collectDailyPoints(context);
//             Navigator.of(context).pop();
//           },
//         );
//       },
//     );
//   }
//
//   late DailyBounus getDailyBounusModel;
//
//   getDailyBounus(context) async {
//     emit(GetDailyPointsLoading());
//
//     DefaultModel response = await homeRepo.getDailyBounus(context);
//     print('Response received: ${response.status}');
//     if (response.status!) {
//       getDailyBounusModel = DailyBounus.fromJson(response.data);
//       print(response.data);
//       emit(GetDailyPointsSuccessfully());
//       checkForDailyPoints(context);
//       print('Daily points: ${getDailyBounusModel.numOfPoints}');
//     } else {
//       emit(GetDailyPointsError());
//       print('Error: ${response.errors}');
//     }
//     return response.status;
//   }
//
//   //*****************************************the Get All Eevent List **************** */
//   List<GetEventModel> eventList = [];
//
//   getAllEventCubit({required BuildContext context}) async {
//     emit(HomeGetAllEventsLoadingState());
//     DefaultModel? response = await homeRepo.getAllEvents(context: context);
//     //  log(response!.message);
//     log(response!.status.toString());
//
//     if (response.status!) {
//       eventList.clear();
//       response.data.forEach((e) {
//         eventList.add(GetEventModel.fromJson(e));
//       });
//       log(eventList[0].cover.toString());
//       log(eventList[0].title.toString());
//
//       emit(HomeGetAllEventsSuccessgState(defaultModel: response));
//     } else {
//       emit(HomeGetAllEventsErrorState(response.errors.toString()));
//       log(response.errors.toString());
//     }
//   }
//
//   //********************************************************************************* */
//
//   ///******************** Get Single Event  Cubit ****************************************** */
//   List<SingleModel> cashedStories = [];
//   Future<bool> getSingleCubit(
//       {required BuildContext context, required int id}) async {
//     emit(HomeGetSingleLoadingState());
//     if (cashedStories.isEmpty ||
//         !cashedStories.any((element) => element.event!.id == id)) {
//       DefaultModel? response =
//           await homeRepo.getSingle(context: context, id: id);
//       if (response!.status!) {
//         cashedStories.add(SingleModel.fromJson(response.data));
//         emit(HomeGetSingleSuccessState(defaultModel: response));
//       } else {
//         emit(HomeGetSingleErrorState(response.errors.toString()));
//         log(response.errors.toString());
//       }
//       return response.status!;
//     } else {
//       emit(HomeGetSingleSuccessState());
//       return true;
//     }
//   }
//
//   ///  //********************************************************************************* */
// ////****************************get Top Coupons **************************** */
//   List<TopCounponsModel> topCouponsList = [];
//   void getTopCouponsCubit({required BuildContext context}) async {
//     emit(HomeGetTopCouponsLoadingState());
//     DefaultModel? response = await homeRepo.getTopCoupons(context: context);
//
//     if (response!.status!) {
//       topCouponsList.clear();
//       response.data.forEach((e) {
//         topCouponsList.add(TopCounponsModel.fromJson(e));
//       });
//       log(topCouponsList[0].toString());
//       emit(HomeGetTopCouponsSuccessState(defaultModel: response));
//     } else {
//       log(response.errors.toString());
//       emit(HomeGetTopCouponsErrorState(response.errors.toString()));
//     }
//   }
//
//   //------------ Get HomeSlider
//
//   List<HomeSliderModel> homeSliderList = [];
//
//   Future<bool?> getSlider(context) async {
//     emit(GetHomeSliderLoadingState());
//
//     DefaultModel? response = await homeRepo.getSlider(context);
//     print('Response received: ${response!.status}');
//     if (response.status!) {
//       homeSliderList.clear();
//       response.data.forEach((e) {
//         homeSliderList.add(HomeSliderModel.fromJson(e));
//         emit(GetHomeSliderSuccessState());
//       });
//       print(response.data);
//       log(homeSliderList[0].image.toString());
//     } else {
//       emit(GetHomeSliderErrorState());
//       log('Error:${response.errors}');
//     }
//     return response.status;
//   }
//
// //  get custom points
//   List<GetCustomPointsModel> customPointsList = [];
//
//   Future<bool> getCustomPoints(BuildContext context) async {
//     emit(GetCustomPointsLoading());
//
//     DefaultModel response = await homeRepo.getCustomPoints(context);
//
//     if (response.status!) {
//       customPointsList.clear(); // Clear the list before adding new points
//       for (var element in response.data) {
//         customPointsList.add(GetCustomPointsModel.fromJson(element));
//       }
//
//       print('Custom points retrieved: ${customPointsList.length}');
//       print(response.data);
//
//       emit(GetCustomPointsSuccessfully());
//
//       if (customPointsList.isNotEmpty) {
//         for (var point in customPointsList) {
//           showCustomPointsPopup(context, point);
//         }
//       }
//       return true;
//     } else {
//       emit(GetCustomPointsError());
//       print('Error from get custom point: ${response.errors}');
//       return false;
//     }
//   }
//
//   void showCustomPointsPopup(BuildContext context, GetCustomPointsModel point) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return CustomPointPopup(
//           point: point,
//           onTap: () async {
//             bool status =
//                 await collectCustomPoints(context, pointId: point.id!);
//             if (status) {
//               Navigator.pop(context);
//             }
//           },
//         );
//       },
//     );
//   }
//
//   Future<bool> collectCustomPoints(context, {required int pointId}) async {
//     emit(CollectCustomPointsLoading());
//     DefaultModel response =
//         await homeRepo.collectCustomPoints(context, pointId: pointId);
//     print('Response received: ${response.status}');
//     if (response.status!) {
//       emit(CollectCustomPointsSuccessfully());
//     } else {
//       emit(CollectCustomPointsError());
//       print('Error: ${response.errors}');
//     }
//     print('Response received: ${response.status}');
//     return response.status!;
//   }
// }
