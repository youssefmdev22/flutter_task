import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task/core/resources/app_colors.dart';

import '../../../core/resources/assets_manager.dart';

class ProductItem extends StatelessWidget {
  String imageUrl;
  String title;
  String desc;
  double price;
  double rate;

  ProductItem({
    required this.imageUrl,
    required this.title,
    required this.desc,
    required this.price,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.lightBlueColor, width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        child: Image.network(imageUrl, fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      top: 2,
                      right: 8,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        color: Colors.white,
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: SvgPicture.asset(SvgAssets.icFavourite),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.labelMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        desc,
                        style: Theme.of(context).textTheme.labelMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "EGP $price",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Row(
                        children: [
                          Text(
                            "Review ($rate)",
                            style: Theme.of(
                              context,
                            ).textTheme.labelMedium!.copyWith(fontSize: 12),
                          ),
                          SizedBox(width: 4),
                          SvgPicture.asset(SvgAssets.icStar),
                          Spacer(),
                          SvgPicture.asset(SvgAssets.icPlus),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
