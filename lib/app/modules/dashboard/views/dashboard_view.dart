import 'package:agro_app/app/core/utils/helpers.dart';
import 'package:agro_app/app/core/values/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('DashboardView'),
        backgroundColor: AppColors.kPrimaryColor,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              // height: _size.height * 0.6,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        height: 100.0,
                        // width: MediaQuery.of(context).size.width * 0.8,
                        image: AssetImage(
                          path(
                            'img/logos/logo.png',
                          ),
                        ),
                      ),
                      Text(
                        'Agro App',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.goblin,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 30.0,
                horizontal: 10.0,
              ),
              // color: AppColors.parsley,
              decoration: BoxDecoration(
                color: AppColors.parsley,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: MenuItemCard(
                      title: 'Cultivos',
                      iconImage: path(
                        'img/icons/sprout.png',
                      ),
                    ),
                  ),
                  Expanded(
                    child: MenuItemCard(
                      title: 'Mantenimiento',
                      iconImage: path(
                        'img/icons/tractor.png',
                      ),
                    ),
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

class MenuItemCard extends StatefulWidget {
  final String iconImage;
  final String title;
  MenuItemCard({
    Key? key,
    required this.iconImage,
    required this.title,
  }) : super(key: key);
  @override
  State<MenuItemCard> createState() => _MenuItemCardState();
}

class _MenuItemCardState extends State<MenuItemCard> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    final menuItem = ({Widget? child}) => Styled.widget(child: child)
        .alignment(Alignment.center)
        .borderRadius(all: 15)
        .ripple()
        .backgroundColor(Colors.white, animate: true)
        .clipRRect(all: 25) // clip ripple
        .borderRadius(all: 25, animate: true)
        .elevation(
          pressed ? 0 : 20,
          borderRadius: BorderRadius.circular(25),
          shadowColor: Color(0x30000000),
        ) // shadow borderRadius
        .constrained(height: 200)
        .padding(all: 10)
        .gestures(
          onTapChange: (tapStatus) => setState(() => pressed = tapStatus),
          onTapDown: (details) => print('tapDown'),
          onTap: () => print('onTap'),
        )
        .scale(all: pressed ? 0.95 : 1.0, animate: true)
        .animate(Duration(milliseconds: 150), Curves.easeOut);
    return menuItem(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            height: 80.0,
            width: 80.0,
            image: AssetImage(
              widget.iconImage,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: AppColors.valhalla,
            ),
          ),
        ],
      ),
    );
  }
}
