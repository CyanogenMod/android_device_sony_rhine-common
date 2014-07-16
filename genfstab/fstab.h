/*
* Copyright (C) 2014 Marcin Chojnacki marcinch7@gmail.com
* Copyright (C) 2014 NovaFusion https://github.com/NovaFusion
* Copyright (C) 2014 Paul Gra https://github.com/CoolDevelopment
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

#ifndef FSTAB_H
#define FSTAB_H

#define FSTAB_PATH "/fstab.qcom"

const char fstab_original_a[] =
"# Android fstab file.\n"
"#<src> <mnt_point> <type> <mnt_flags> <fs_mgr_flags>\n"
"# The filesystem that contains the filesystem checker binary (typically /system) cannot\n"
"# specify MF_CHECK, and must come before any filesystems that do specify MF_CHECK\n\n"
"/dev/block/platform/msm_sdcc.1/by-name/boot      /boot     emmc  defaults                                       recoveryonly\n"
;

const char fstab_system_f2fs[] = "/dev/block/platform/msm_sdcc.1/by-name/system    /system   f2fs  ro,noatime,nosuid,nodev,discard,nodiratime,inline_xattr         wait\n";
const char fstab_system_ext4[] = "/dev/block/platform/msm_sdcc.1/by-name/system    /system   ext4  ro,barrier=1                                                    wait\n";

const char fstab_cache_f2fs[] = "/dev/block/platform/msm_sdcc.1/by-name/cache /cache f2fs noatime,nosuid,nodev,discard,nodiratime,inline_xattr,flush_merge wait,nonremovable\n";
const char fstab_cache_ext4[] = "/dev/block/platform/msm_sdcc.1/by-name/cache /cache ext4  noatime,nosuid,nodev,barrier=1,data=ordered,nomblk_io_submit,noauto_da_alloc,errors=panic  wait,check\n";

const char fstab_data_f2fs[] = "/dev/block/platform/msm_sdcc.1/by-name/userdata /data f2fs noatime,nosuid,nodev,discard,nodiratime,inline_xattr,flush_merge wait,nonremovable,encryptable=footer,length=-16384\n";
const char fstab_data_ext4[] = "/dev/block/platform/msm_sdcc.1/by-name/userdata /data ext4     noatime,nosuid,nodev,barrier=1,data=ordered,nomblk_io_submit,noauto_da_alloc,errors=panic wait,check,encryptable=footer,length=-16384\n";

const char fstab_original_b[] =
"/dev/block/platform/msm_sdcc.1/by-name/apps_log  /mnt/idd  ext4  noatime,nosuid,nodev,noexec,barrier=0,discard  wait\n\n"
"/dev/block/platform/msm_sdcc.1/by-name/modemst1  /boot/modem_fs1   emmc  n/a       n/a\n"
"/dev/block/platform/msm_sdcc.1/by-name/modemst2  /boot/modem_fs2   emmc  n/a       n/a\n\n"
"/devices/msm_sdcc.2/mmc_host                     auto              auto  defaults  voldmanaged=sdcard1:auto\n"
"/devices/platform/xhci-hcd                       auto              auto  defaults  voldmanaged=usbdisk:auto\n"
;

#endif


