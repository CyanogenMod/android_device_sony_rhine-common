# Copyright (C) 2012 The Android Open Source Project
# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""Custom OTA Package commands for rhine"""

import os

TARGET_DEVICE = os.getenv('CM_BUILD')

def FullOTA_Assertions(self):
  if TARGET_DEVICE == "togari_gpe":
    self.script.AppendExtra('assert(is_substring("GPE", getprop("ro.boot.s1boot")) == "t");')
  if TARGET_DEVICE == "togari":
    self.script.AppendExtra('assert(is_substring("GPE", getprop("ro.boot.s1boot")) != "t");')
