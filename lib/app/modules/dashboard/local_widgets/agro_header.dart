import 'package:agro_app/app/core/utils/helpers.dart';
import 'package:agro_app/app/core/values/app_colors.dart';
import 'package:flutter/material.dart';

class AgroLogo extends StatelessWidget {
  const AgroLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          height: 80.0,
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
    );
  }
}

class AgroHeader extends StatelessWidget {
  const AgroHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.0),
      child: Center(
        child: AgroLogo(),
      ),
    );
  }
}
