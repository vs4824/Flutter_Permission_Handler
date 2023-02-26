import 'dart:io';

import 'package:baseflow_plugin_template/baseflow_plugin_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../permission/permission_widgets.dart';

class PermissionHandlerWidget extends StatefulWidget {
  /// Create a page containing the functionality of this plugin
  static ExamplePage createPage() {
    return ExamplePage(
        Icons.location_on, (context) => PermissionHandlerWidget());
  }

  @override
  _PermissionHandlerWidgetState createState() =>
      _PermissionHandlerWidgetState();
}

class _PermissionHandlerWidgetState extends State<PermissionHandlerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Permission Handler"),
      ),
      body: Center(
        child: ListView(
            children: Permission.values
                .where((permission) {
              if (Platform.isIOS) {
                return permission != Permission.unknown &&
                    permission != Permission.sms &&
                    permission != Permission.storage &&
                    permission != Permission.ignoreBatteryOptimizations &&
                    permission != Permission.accessMediaLocation &&
                    permission != Permission.activityRecognition &&
                    permission != Permission.manageExternalStorage &&
                    permission != Permission.systemAlertWindow &&
                    permission != Permission.requestInstallPackages &&
                    permission != Permission.accessNotificationPolicy &&
                    permission != Permission.bluetoothScan &&
                    permission != Permission.bluetoothAdvertise &&
                    permission != Permission.bluetoothConnect;
              } else {
                return permission != Permission.unknown &&
                    permission != Permission.mediaLibrary &&
                    permission != Permission.photos &&
                    permission != Permission.photosAddOnly &&
                    permission != Permission.reminders &&
                    permission != Permission.appTrackingTransparency &&
                    permission != Permission.criticalAlerts;
              }
            })
                .map((permission) => PermissionWidget(permission))
                .toList()),
      ),
    );
  }
}