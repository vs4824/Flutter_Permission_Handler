# Flutter Permission Handler

On most operating systems, permissions aren't just granted to apps at install time. Rather, developers have to ask the user for permissions while the app is running.

This plugin provides a cross-platform (iOS, Android) API to request permissions and check their status. You can also open the device's app settings so users can grant a permission.
On Android, you can show a rationale for requesting a permission.

## Setup

While the permissions are being requested during runtime, you'll still need to tell the OS which permissions your app might potentially use. That requires adding permission configuration to Android- and iOS-specific files.

### How to use 

There are a number of Permissions. You can get a Permission's status, which is either granted, denied, restricted or permanentlyDenied.

```
var status = await Permission.camera.status;
if (status.isDenied) {
// We didn't ask for permission yet or the permission has been denied before but not permanently.
}

// You can can also directly ask the permission about its status.
if (await Permission.location.isRestricted) {
// The OS restricts access, for example because of parental controls.
} 
```

Call request() on a Permission to request it. If it has already been granted before, nothing happens.
request() returns the new status of the Permission.

```
if (await Permission.contacts.request().isGranted) {
  // Either the permission was already granted before or the user just granted it.
}

// You can request multiple permissions at once.
Map<Permission, PermissionStatus> statuses = await [
  Permission.location,
  Permission.storage,
].request();
print(statuses[Permission.location]);
```

Some permissions, for example location or acceleration sensor permissions, have an associated service, which can be enabled or disabled.

```
if (await Permission.locationWhenInUse.serviceStatus.isEnabled) {
  // Use location.
}
```

You can also open the app settings:

```
if (await Permission.speech.isPermanentlyDenied) {
  // The user opted to never again see the permission request dialog for this
  // app. The only way to change the permission's status now is to let the
  // user manually enable it in the system settings.
  openAppSettings();
}
```

On Android, you can show a rationale for using a permission:

```bool isShown = await Permission.contacts.shouldShowRequestRationale;```

Some permissions will not show a dialog asking the user to allow or deny the requested permission.
This is because the OS setting(s) of the app are being retrieved for the corresponding permission.
The status of the setting will determine whether the permission is granted or denied.

The following permissions will show no dialog:

Notification
Bluetooth
The following permissions will show no dialog, but will open the corresponding setting intent for the user to change the permission status:

manageExternalStorage
systemAlertWindow
requestInstallPackages
accessNotificationPolicy

The locationAlways permission can not be requested directly, the user has to request the locationWhenInUse permission first. Accepting this permission by clicking on the 'Allow While Using App' gives the user the possibility to request the locationAlways permission. This will then bring up another permission popup asking you to Keep Only While Using or to Change To Always Allow.
