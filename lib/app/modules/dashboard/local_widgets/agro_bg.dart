import 'package:agro_app/app/core/values/app_colors.dart';
import 'package:flutter/material.dart';

class AgroBg extends StatelessWidget {
  const AgroBg({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .45,
      padding: EdgeInsets.symmetric(
        vertical: 30.0,
        horizontal: 10.0,
      ),
      decoration: BoxDecoration(
          color: AppColors.parsley,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40.0),
            topLeft: Radius.circular(40.0),
          ),
          gradient: LinearGradient(
            stops: [
              0.10,
              0.90,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              AppColors.parsley,
              AppColors.goblin,
            ],
          )),
    );
  }
}
