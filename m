From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: pinctrl-sx150x.c broken in 4.11
Date: Wed, 10 May 2017 22:32:27 +0300
Message-ID: <04424bd9-daba-e803-23ce-e7604bf41c71@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:36748 "EHLO
        mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753413AbdEJTca (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 May 2017 15:32:30 -0400
Received: by mail-wm0-f52.google.com with SMTP id u65so15553467wmu.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 May 2017 12:32:30 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Chris Healy <Chris.Healy@zii.aero>, Jeff White <Jeff.White@zii.aero>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi

Looks like recent pinctrl changes - possibly commit 99e4f67508e1
("pinctrl: core: Use delayed work for hogs") - breaks pinctrl-sx150x
driver in all setups where it has any pinctrl settings in device tree.

AFAIU, pinctrl-sx150x is not a real pinctrl/pinmux driver, but it uses
pinctrl subsystem to provide control over GPIO lines it provides.  But
for user, it is just a i2c-gpio device that is enabled via device tree,
and, like other devices, can have pinctrl-0 that points to "real" pinmux
configuration for involved hardware lines (i.e. line used for interrupt).

Problem is that when pinctrl-sx150x driver registers itself via
pinctrl_register(), pinctrl map that corresponds to pinctrl-0 property
of sx150x device tree node, is misinterpreted as hog.  Corresponding
call chain is

  pinctrl_enable() ->
    pinctrl_claim_hogs() ->
      create_pinctrl()

at this point, registered pinctrl maps are scanned and matched by device
name only, without checking map's control device. Then map is passed to
add_setting() with pctldev set to sx150x which does not provide
pinmux_ops, which errors out:

sx150x-pinctrl 10-0020: does not support mux function
sx150x-pinctrl 10-0020: could not map pin config for "VF610_PAD_PTB1"
sx150x-pinctrl 10-0020: error claiming hogs: -22
sx150x-pinctrl 10-0020: could not claim hogs: -22
sx150x-pinctrl 10-0020: Failed to register pinctrl device
sx150x-pinctrl: probe of 10-0020 failed with error -22

Before commit 99e4f67508e1 ("pinctrl: core: Use delayed work for hogs")
problem was hidden by not passing pinctrl device to add_setting(), but
instead getting that from map.


What is proper fix for this?
Maybe something like

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 32822b0d9cd0..78dde7594825 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1038,6 +1038,9 @@ static struct pinctrl *create_pinctrl(struct
device *dev,
                /* Map must be for this device */
                if (strcmp(map->dev_name, devname))
                        continue;
+               if (pctldev &&
+                   strcmp(dev_name(pctldev->dev), map->ctrl_dev_name))
+                       continue;

                ret = add_setting(p, pctldev, map);
                /*
