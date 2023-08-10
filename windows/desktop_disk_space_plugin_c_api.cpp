#include "include/desktop_disk_space/desktop_disk_space_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "desktop_disk_space_plugin.h"

void DesktopDiskSpacePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  desktop_disk_space::DesktopDiskSpacePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
