# Flutter Permission Handler

On most operating systems, permissions aren't just granted to apps at install time. Rather, developers have to ask the user for permissions while the app is running.

This plugin provides a cross-platform (iOS, Android) API to request permissions and check their status. You can also open the device's app settings so users can grant a permission.
On Android, you can show a rationale for requesting a permission.

## Setup

While the permissions are being requested during runtime, you'll still need to tell the OS which permissions your app might potentially use. That requires adding permission configuration to Android- and iOS-specific files.

### How to use 

There are a number of Permissions. You can get a Permission's status, which is either granted, denied, restricted or permanentlyDenied.

''' 
var status = await Permission.camera.status;
if (status.isDenied) {
// We didn't ask for permission yet or the permission has been denied before but not permanently.
}

// You can can also directly ask the permission about its status.
if (await Permission.location.isRestricted) {
// The OS restricts access, for example because of parental controls.
} 
'''
