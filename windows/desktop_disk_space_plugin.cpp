#include "desktop_disk_space_plugin.h"

// This must be included before many other Windows headers.
#include <windows.h>

// For getPlatformVersion; remove unless needed for your plugin implementation.
#include <VersionHelpers.h>

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>
#include <flutter/standard_method_codec.h>
#include <windows.h>

#include <memory>
#include <sstream>

namespace desktop_disk_space {

// static
void DesktopDiskSpacePlugin::RegisterWithRegistrar(
    flutter::PluginRegistrarWindows *registrar) {
  auto channel =
      std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
          registrar->messenger(), "desktop_disk_space",
          &flutter::StandardMethodCodec::GetInstance());

  auto plugin = std::make_unique<DesktopDiskSpacePlugin>();

  channel->SetMethodCallHandler(
      [plugin_pointer = plugin.get()](const auto &call, auto result) {
        plugin_pointer->HandleMethodCall(call, std::move(result));
      });

  registrar->AddPlugin(std::move(plugin));
}

DesktopDiskSpacePlugin::DesktopDiskSpacePlugin() {}

DesktopDiskSpacePlugin::~DesktopDiskSpacePlugin() {}

std::string getFreeSpace(flutter::EncodableMap args) {
  std::string driveStr = std::get<std::string>(args.at(flutter::EncodableValue("drive")));
  unsigned long long freebytes = 0;
  LPSTR drive = const_cast<char *>(driveStr.c_str());
  GetDiskFreeSpaceExA(drive, (ULARGE_INTEGER*)&freebytes, NULL, NULL);
  return std::to_string(freebytes);
}

std::string getTotalSpace(flutter::EncodableMap args) {
  std::string driveStr = std::get<std::string>(args.at(flutter::EncodableValue("drive")));
  unsigned long long totalBytes = 0;
  LPSTR drive = const_cast<char *>(driveStr.c_str());
  GetDiskFreeSpaceExA(drive, NULL, (ULARGE_INTEGER*)&totalBytes, NULL);
  return std::to_string(totalBytes);
}

void DesktopDiskSpacePlugin::HandleMethodCall(
    const flutter::MethodCall<flutter::EncodableValue> &method_call,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result) {
  if (method_call.method_name().compare("getFreeSpace") == 0) {
    const flutter::EncodableMap& args = std::get<flutter::EncodableMap>(*method_call.arguments());
    result->Success(getFreeSpace(args));
  } else if (method_call.method_name().compare("getTotalSpace") == 0) {
    const flutter::EncodableMap& args = std::get<flutter::EncodableMap>(*method_call.arguments());
    result->Success(getTotalSpace(args));
  }
  else {
    result->NotImplemented();
  }
}

}  // namespace desktop_disk_space
