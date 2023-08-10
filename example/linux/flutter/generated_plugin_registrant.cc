//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <desktop_disk_space/desktop_disk_space_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) desktop_disk_space_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "DesktopDiskSpacePlugin");
  desktop_disk_space_plugin_register_with_registrar(desktop_disk_space_registrar);
}
