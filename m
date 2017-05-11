From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH] pinctrl: when claiming hog, skip maps not served by same device
Date: Thu, 11 May 2017 23:02:11 +0300
Message-ID: <20170511200211.20985-1-nikita.yoush@cogentembedded.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:34978 "EHLO
        mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932590AbdEKUCa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 May 2017 16:02:30 -0400
Received: by mail-wm0-f41.google.com with SMTP id b84so53909734wmh.0
        for <linux-gpio@vger.kernel.org>; Thu, 11 May 2017 13:02:29 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Tony Lindgren <tony@atomide.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jon Hunter <jonathanh@nvidia.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Healy <Chris.Healy@zii.aero>, Jeff.White@zii.aero, Nikita Yushchenko <nikita.yoush@cogentembedded.com>

When pinctrl device registers, it automatically claims hogs, that is,
maps that pinctrl device serves for itself.

It is possible that in addition to SoC's pinctrl device, other pinctrl
devices get registered. E.g. some gpio expander devies are registered
as pinctrl devices. For such devices, pinctrl maps could be defined
that set up SoC's pins (e.g. interrupt pin for gpio expander). Such
a map will have target device set to gpio expander.

Here is device tree snippet that causes this scenario:

&i2c0 {
	sx1503@20 {
		compatible = "semtech,sx1503q";
		pinctrl-names = "default";
		pinctrl-0 = <&pinctrl_sx1503_20>;
		...
	};
};
...
&iomuxc {
	pinctrl_sx1503_20: pinctrl-sx1503-20 {
		fsl,pins = <
			VF610_PAD_PTB1__GPIO_23         0x219d
		>;
	};
};

Such a map will have target device set to gpio expander. However is not
a hog, it is a regular map that is claimed by core before gpio expander
device is probed.

Thus when looking for hogs, it is not enough to check that map's target
device is set to pinctrl device being registered. Need also check that
map's control device is also set to the same.

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/pinctrl/core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 1653cbda6a82..682ebd360030 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1038,6 +1038,16 @@ static struct pinctrl *create_pinctrl(struct device *dev,
 		/* Map must be for this device */
 		if (strcmp(map->dev_name, devname))
 			continue;
+		/*
+		 * If pctldev is not null, we are claiming hog for it,
+		 * that means, setting that is served by pctldev by itself.
+		 *
+		 * Thus we must skip map that is for this device but is served
+		 * by other device.
+		 */
+		if (pctldev &&
+		    strcmp(dev_name(pctldev->dev), map->ctrl_dev_name))
+			continue;
 
 		ret = add_setting(p, pctldev, map);
 		/*
-- 
2.11.0

