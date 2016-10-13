#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 19261440 44a093f5f3f983ecc1532120d8371dca6fc2b139 14534656 f86238e774143e1eea3e523f0fa54e4105e59a1e
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:19261440:44a093f5f3f983ecc1532120d8371dca6fc2b139; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:14534656:f86238e774143e1eea3e523f0fa54e4105e59a1e EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 44a093f5f3f983ecc1532120d8371dca6fc2b139 19261440 f86238e774143e1eea3e523f0fa54e4105e59a1e:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
