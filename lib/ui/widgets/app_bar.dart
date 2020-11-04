import 'package:flutter/material.dart';
import 'package:smart_mobe_task/assets/colors.dart';

Widget smartMobeTaskAppBar({
  @required String title,
  String imageUrl,
  Function onTapDrawer,
}) {
  return Container(
    color: SmartMobeTaskColors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                children: [
                  if (imageUrl != null) ...[
                    Image.network(
                      imageUrl,
                      height: 20.0,
                      width: 20.0,
                    ),
                    SizedBox(width: 12.0),
                  ],
                  Text(
                    '$title',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 8.0,
        ),
        IconButton(
          icon: Icon(Icons.blur_linear),
          onPressed: onTapDrawer,
        )
      ],
    ),
  );
}
