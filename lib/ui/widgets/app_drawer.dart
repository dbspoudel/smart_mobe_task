import 'package:flutter/material.dart';
import 'package:smart_mobe_task/assets/colors.dart';
import 'package:smart_mobe_task/assets/text_style.dart';
import 'package:smart_mobe_task/helper/transition.dart';

class MenuItem {
  final Widget icon;
  final String title;
  final Widget onTapTarget;

  MenuItem({this.icon, @required this.title, this.onTapTarget});
}

class AppDrawer extends StatelessWidget {
  final List<MenuItem> _menu = [
    MenuItem(
      icon: Icon(
        Icons.home,
        color: SmartMobeTaskColors.drawerMenuIcon,
      ),
      title: 'Donation',
    ),
    MenuItem(
      icon: Icon(
        Icons.home,
        color: SmartMobeTaskColors.drawerMenuIcon,
      ),
      title: 'Adoption',
    ),
    MenuItem(
      icon: Icon(
        Icons.favorite_border,
        color: SmartMobeTaskColors.drawerMenuIcon,
      ),
      title: 'Favorites',
    ),
    MenuItem(
      icon: Icon(
        Icons.message,
        color: SmartMobeTaskColors.drawerMenuIcon,
      ),
      title: 'Messages',
    ),
    MenuItem(
      icon: Icon(
        Icons.person_outline,
        color: SmartMobeTaskColors.drawerMenuIcon,
      ),
      title: 'Profile',
    ),
  ];

  void _buildMenu(
      MenuItem menuItem, List<Widget> menuItems, BuildContext context) {
    menuItems.add(
      GestureDetector(
        onTap: () {
          Navigator.pop(context);
          if (null != menuItem.onTapTarget) {
            Navigator.of(context)
                .push(slideFromRightTransition(menuItem.onTapTarget));
          }
        },
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 8.0),
          dense: true,
          leading: Container(
            width: 20,
            height: 20,
            child: menuItem.icon,
          ),
          title: Text(
            '${menuItem.title}',
            style: SmartMobeTextStyle.menuItemTextStyle,
          ),
        ),
      ),
    );
  }

  List<Widget> _makeDrawerMenuItems(BuildContext context) {
    List<Widget> items = List<Widget>();

    _menu.forEach((element) {
      _buildMenu(element, items, context);
    });

    return items;
  }

  _buildProfileViewTile() {
    return Container(
      margin: EdgeInsets.only(
        top: 32.0,
        bottom: 62.0,
      ),
      child: Row(
        children: [
          Container(
            height: 80.0,
            width: 80.0,
            child: Stack(
              children: [
                Container(
                  height: 70.0,
                  width: 70.0,
                  decoration: BoxDecoration(
                      color: SmartMobeTaskColors.white,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Image(
                    image: NetworkImage(
                        "https://i.picsum.photos/id/1005/5760/3840.jpg?hmac=2acSJCOwz9q_dKtDZdSB-OIK1HUcwBeXco_RMMTUgfY"),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                      decoration: BoxDecoration(
                        color: SmartMobeTaskColors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: SmartMobeTaskColors.drawerBackground,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.edit,
                        size: 14.0,
                        color: SmartMobeTaskColors.grey,
                      )),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            margin: EdgeInsets.only(bottom: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Marco Reus',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: SmartMobeTaskColors.white,
                  ),
                ),
                Text(
                  "marcore@gmail.com",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: SmartMobeTaskColors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildLogoutButton() {
    return Container(
      height: 50,
      child: ListTile(
        dense: true,
        leading: Container(
          width: 20,
          height: 20,
          child: Icon(
            Icons.power_settings_new,
            color: SmartMobeTaskColors.white,
          ),
        ),
        title: Text(
          'Log Out',
          style: SmartMobeTextStyle.menuItemTextStyle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(32.0),
      ),
      child: Drawer(
        child: Container(
          color: SmartMobeTaskColors.drawerBackground,
          padding: EdgeInsets.fromLTRB(42.0, 32.0, 12.0, 32.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildProfileViewTile(),
              Expanded(
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: _makeDrawerMenuItems(context),
                ),
              ),
              _buildLogoutButton()
            ],
          ),
        ),
      ),
    );
  }
}
