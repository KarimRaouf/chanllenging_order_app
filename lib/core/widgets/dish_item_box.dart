import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../generated/assets.dart';
import '../app_strings/app_strings.dart';
import '../helper/spacing.dart';
import '../theming/app_colors.dart';
import '../theming/styles.dart';
import 'app_text_form_field.dart';

class DishItemBox extends StatelessWidget {
  const DishItemBox({
    super.key,
    this.isMenu = false,
    this.menuItems,
    required this.index,
  });

  final menuItems;
  final int index;
  final bool isMenu;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.beige, // Card Color
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: DishItem(
            isMenu: isMenu,
            itemName: menuItems[index]['item_name'],
            itemPrice: menuItems[index]['price'],

          ),
        ),
      ],
    );
  }
}

class DishItem extends StatefulWidget {
  const DishItem({
    super.key,
    required this.isMenu,
    required this.itemName,
    this.itemPrice,
  });

  final bool isMenu;

  final String itemName;
  final dynamic itemPrice;

  @override
  State<DishItem> createState() => _DishItemState();
}

class _DishItemState extends State<DishItem> {
  final supabase = Supabase.instance.client;

  Future<void> placeOrder() async {
    try {
      final response = await supabase.from('orders').insert({
        'item_name': widget.itemName,
        'price': widget.itemPrice,
        'status': 'Not Started',
        'username': 'Karim AbdEl-Raouf Mohamed',
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
              'Order Placed Successfully',
              style: AppTextStyles.font14BlackRegular,
            ),
            backgroundColor: AppColors.darkBeige),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}',
              style: AppTextStyles.font14BlackRegular),
          backgroundColor: AppColors.darkBeige,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              // Image.network(
              //   widget.imageUrl,
              //   height: 75.h,
              //   width: 75.w,
              // ),
              // horizontalSpace(16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Name:  ',
                          style: AppTextStyles.font14BlackBold,
                        ),
                        TextSpan(
                          text: widget.itemName,
                          style: AppTextStyles.font14BlackRegular,
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(8),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Price:  ',
                          style: AppTextStyles.font14BlackBold,
                        ),
                        TextSpan(
                          text: '${widget.itemPrice} \$',
                          style: AppTextStyles.font14BlackRegular,
                        ),
                      ],
                    ),
                  ),
                  // verticalSpace(8),
                  // RichText(
                  //   text: TextSpan(
                  //     children: [
                  //       TextSpan(
                  //         text: 'Status:  ',
                  //         style: AppTextStyles.font14BlackBold,
                  //       ),
                  //       TextSpan(
                  //         text: 'Preparing',
                  //         style: AppTextStyles.font14BlackRegular,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ],
          ),

          Visibility(
            visible: widget.isMenu,
            child: InkWell(
              onTap: () async {
                await placeOrder();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppStrings.orderNow,
                    style: AppTextStyles.font14BlackBold,
                    textAlign: TextAlign.center,
                  ),
                  horizontalSpace(4),
                  Icon(
                    Icons.double_arrow_sharp,
                    color: AppColors.lightGrey,
                    weight: 1.6,
                  ),
                ],
              ),
            ),
          ),

          // verticalSpace(12),
        ],
      ),
    );
  }
}
