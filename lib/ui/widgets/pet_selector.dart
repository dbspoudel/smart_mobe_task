import 'package:flutter/material.dart';
import 'package:smart_mobe_task/assets/colors.dart';
import 'package:smart_mobe_task/assets/text_style.dart';
import 'package:smart_mobe_task/data/constant.dart';

class PetSecectorDataModel {
  final Pets label;
  final Widget icon;

  PetSecectorDataModel({
    @required this.label,
    this.icon,
  });
}

class PetSelector extends StatefulWidget {
  final List<PetSecectorDataModel> optionList;
  final Function(String) onChangeEventHandler;

  const PetSelector({
    @required this.optionList,
    @required this.onChangeEventHandler,
    Key key,
  }) : super(key: key);

  @override
  _PetSelectorState createState() => _PetSelectorState();
}

class _PetSelectorState extends State<PetSelector> {
  String selectedItem;

  onchanged(String newValue) {
    setState(() {
      selectedItem = newValue;
    });
    widget.onChangeEventHandler(newValue);
  }

  petsToTitle(Pets pets) {
    switch (pets) {
      case Pets.CAT:
        return "Cat";
      case Pets.DOG:
        return "Dog";
      default:
        return "Unknown";
    }
  }

  Widget _buildSingleItem(String title, Widget icon) {
    bool isSelected = title == selectedItem;
    return GestureDetector(
      onTap: () {
        if (!isSelected) onchanged(title);
      },
      child: Container(
        height: 60.0,
        decoration: BoxDecoration(
            color: isSelected ? SmartMobeTaskColors.grey10 : Colors.transparent,
            borderRadius: BorderRadius.circular(30.0),
            border: Border.all(
              color: SmartMobeTaskColors.grey10,
              width: 2.0,
            )),
        padding: EdgeInsets.only(
          left: 22.0,
          right: 10.0,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 12.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "$title",
              style: SmartMobeTextStyle.h6.copyWith(fontSize: 18.0),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: icon ?? SizedBox.shrink(),
            ),
            Radio(
              value: "$title",
              groupValue: selectedItem,
              onChanged: (_) => null,
              activeColor: SmartMobeTaskColors.black,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: widget.optionList
          .map((e) => _buildSingleItem(petsToTitle(e.label), e.icon))
          .toList(),
    );
  }
}
