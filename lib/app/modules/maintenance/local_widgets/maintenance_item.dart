import 'package:agro_app/app/core/values/app_colors.dart';
import 'package:agro_app/app/data/model/maintenance.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:styled_widget/styled_widget.dart';

class MaintenanceItem extends StatefulWidget {
  MaintenanceItem(
      {required this.icon,
      required this.iconBgColor,
      required this.maintenance});

  final Maintenance maintenance;
  final IconData icon;
  final Color iconBgColor;

  @override
  _MaintenanceItemState createState() => _MaintenanceItemState();
}

class _MaintenanceItemState extends State<MaintenanceItem> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    final maintenanceItem = ({Widget? child}) => Styled.widget(child: child)
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
        .constrained(height: 120)
        .padding(vertical: 12) // margin
        .gestures(
          onTapChange: (tapStatus) => setState(() => pressed = tapStatus),
          onTapDown: (details) => print('tapDown'),
          onTap: () => print('onTap'),
        )
        .scale(all: pressed ? 0.95 : 1.0, animate: true)
        .animate(Duration(milliseconds: 150), Curves.easeOut);

    final Widget icon = Icon(widget.icon, size: 20, color: Colors.white)
        .padding(all: 12)
        .decorated(
          color: widget.iconBgColor,
          borderRadius: BorderRadius.circular(30),
        )
        .padding(left: 15, right: 10);

    final Widget title = [
      Text(
        'Fecha ',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
      Text(
        DateFormat('yyyy-MM-dd hh:mm').format(widget.maintenance.maFecha),
      ),
    ].toRow();

    final Widget state = [
      Text(
        'Estado ',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
      Text(
        widget.maintenance.maEstado,
        style: TextStyle(
          color: Colors.grey[400],
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      )
    ].toRow();

    final Widget description = [
      Text(
        'Descripción ',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
      Text(
        '${widget.maintenance.maDescripcion}',
        style: TextStyle(
          color: Colors.grey[500],
          // fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    ].toRow();

    final Widget worker = [
      Text(
        'Trabajador ',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
      Text(
        widget.maintenance.fkTrabajadorManteni,
        style: TextStyle(
          color: Colors.grey[500],
          // fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    ].toRow();

    final Widget maintenanceType = [
      Text(
        'Tipo mantenimiento.',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
      Text(
        widget.maintenance.fkTiposMatenimiento.toString(),
        style: TextStyle(
          color: Colors.grey[500],
          // fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    ].toRow();

    return maintenanceItem(
      child: <Widget>[
        icon,
        <Widget>[
          title,
          description,
          state,
          worker,
          maintenanceType,
        ].toColumn(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ].toRow(),
    );
  }
}
