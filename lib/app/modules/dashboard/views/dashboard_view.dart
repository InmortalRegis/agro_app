import 'package:agro_app/app/core/utils/helpers.dart';
import 'package:agro_app/app/core/values/app_colors.dart';
import 'package:agro_app/app/modules/dashboard/local_widgets/menu_item.dart';
import 'package:agro_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('🍀 Agro App'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            AgroHeader(),
            Positioned(
              child: AgroBg(),
              left: 0,
              right: 0,
              bottom: 0,
            ),
            Positioned(
              bottom: _size.height * 0.40,
              left: 0.0,
              right: 0.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: MenuItemCard(
                      title: 'Cultivos',
                      iconImage: path(
                        'img/icons/sprout.png',
                      ),
                      to: Routes.CROPS,
                    ),
                  ),
                  Expanded(
                    child: MenuItemCard(
                      title: 'Mantenimiento',
                      iconImage: path(
                        'img/icons/tractor.png',
                      ),
                      to: Routes.MAINTENANCE,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AgroBg extends StatelessWidget {
  const AgroBg({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .55,
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
    );
  }
}

class AgroHeader extends StatelessWidget {
  const AgroHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      height: _size.height * 0.30,
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
    );
  }
}
