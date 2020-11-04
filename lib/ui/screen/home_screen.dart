import 'package:flutter/material.dart';
import 'package:smart_mobe_task/assets/text_style.dart';
import 'package:smart_mobe_task/ui/widgets/app_bar.dart';
import 'package:smart_mobe_task/ui/widgets/app_drawer.dart';
import 'package:smart_mobe_task/ui/widgets/pet_selector.dart';
import 'package:smart_mobe_task/ui/widgets/pet_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: AppDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              smartMobeTaskAppBar(
                title: "Adope",
                imageUrl: "https://cdn4.iconfinder.com/data/icons/social-media-logos-6/512/136-adobe-512.png",
                onTapDrawer: () => scaffoldKey.currentState.openEndDrawer(),
              ),
              Text(
                "Find your\nawesome pet",
                style: SmartMobeTextStyle.h4,
              ),
              PetSelector(
                optionList: [
                  PetSecectorDataModel(label: "Dog"),
                  PetSecectorDataModel(label: "Cat")
                ],
                onChangeEventHandler: (newValue) {
                  print(newValue);
                },
              ),
              Expanded(child: PetView()),
            ],
          ),
        ),
      ),
    );
  }
}
