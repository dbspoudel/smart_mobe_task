import 'package:flutter/material.dart';
import 'package:smart_mobe_task/assets/colors.dart';

class CatCardViewTest extends CatCardView {
  CatCardViewTest()
      : super(
            name: "Mimi Perry",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTUeBLENQ3iZ8BR-rnsgyVIzzLaf_JaMOIHPg&usqp=CAU",
            years: 1,
            gender: "Boy",
            description:
                "Mimi is a family friendly cat. He like to play with us and go outing.");
}

class CatCardView extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int years;
  final String gender;
  final String description;
  const CatCardView({
    @required this.name,
    this.imageUrl,
    this.years,
    this.gender,
    this.description,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: SmartMobeTaskColors.grey10,
          width: 2.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 60.0,
            width: 60.0,
            margin: EdgeInsets.fromLTRB(26, 22, 8, 22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: SmartMobeTaskColors.grey10,
                width: 2.0,
              ),
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.cover),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$name",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.brightness_1,
                          size: 4.0,
                          color: Colors.redAccent,
                        ),
                        SizedBox(width: 4.0),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "$years Year Old",
                            style: TextStyle(
                              fontSize: 10.0,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.brightness_1,
                          size: 4.0,
                          color: SmartMobeTaskColors.grey80,
                        ),
                        SizedBox(width: 4.0),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "$gender",
                            style: TextStyle(
                              fontSize: 10.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "$description",
                    style: TextStyle(
                      fontSize: 10.0,
                    ),
                    maxLines: 2,
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    "Visit Home",
                    style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w700,
                        color: SmartMobeTaskColors.amber),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
