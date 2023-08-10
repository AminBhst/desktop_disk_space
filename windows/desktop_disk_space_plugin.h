#ifndef FLUTTER_PLUGIN_DESKTOP_DISK_SPACE_PLUGIN_H_
#define FLUTTER_PLUGIN_DESKTOP_DISK_SPACE_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace desktop_disk_space {

class DesktopDiskSpacePlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  DesktopDiskSpacePlugin();

  virtual ~DesktopDiskSpacePlugin();

  // Disallow copy and assign.
  DesktopDiskSpacePlugin(const DesktopDiskSpacePlugin&) = delete;
  DesktopDiskSpacePlugin& operator=(const DesktopDiskSpacePlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace desktop_disk_space

#endif  // FLUTTER_PLUGIN_DESKTOP_DISK_SPACE_PLUGIN_H_
