import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/utils/utilColors.dart';
import 'package:weather_app/utils/utilString.dart';

class Detail extends StatelessWidget {
  final String title;
  final String value;
  final String deg;
  final String txtStdr;

  const Detail({
    Key key,
    this.title = "",
    this.value = "",
    this.deg = "",
    this.txtStdr = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            title,
            style: TextStyle(
              color: UtilColors.colorSubTitleCity,
              fontWeight: FontWeight.w400,
            ),
            presetFontSizes: [UtilString.fontSizeDetail, 16, 14, 12, 10, 8],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                value,
                style: TextStyle(fontSize: UtilString.fontSizeDetail),
                presetFontSizes: [UtilString.fontSizeValue, 16, 14, 12, 10, 8],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              AutoSizeText(
                " ",
                presetFontSizes: [UtilString.fontSizeValue, 16, 14, 12, 10, 8],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Column(
                children: [
                  AutoSizeText(
                    deg,
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                    ),
                    presetFontSizes: [
                      UtilString.fontSizeValue,
                      16,
                      14,
                      12,
                      10,
                      8
                    ],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  AutoSizeText(
                    "",
                    style: TextStyle(
                      fontSize: 5,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              AutoSizeText(
                txtStdr,
                style: TextStyle(fontSize: UtilString.fontSizeValue),
                presetFontSizes: [UtilString.fontSizeValue, 16, 14, 12, 10, 8],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
