import 'package:flutter/material.dart';
import 'package:smart_mobe_task/assets/colors.dart';
import 'package:smart_mobe_task/ui/widgets/app_bar.dart';
import 'package:smart_mobe_task/ui/widgets/cat_card_view.dart';

class PetsViewScreen extends StatefulWidget {
  PetsViewScreen({Key key}) : super(key: key);

  @override
  _PetsViewScreenState createState() => _PetsViewScreenState();
}

class _PetsViewScreenState extends State<PetsViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: smartMobeTaskAppBar(
        title: "Persian Cat",
        onTapBackButton: () => Navigator.pop(context),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Icon(Icons.scatter_plot),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 18.0),
            child: Text(
              "Choose your cat",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: SmartMobeTaskColors.black,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 32.0),
                  child: CatCardViewTest(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
