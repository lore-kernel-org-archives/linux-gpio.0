From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: [PATCH v2] pinctrl: mvebu: complain about missing group after checking variant
Date: Sat, 28 Nov 2015 11:26:49 +0100
Message-ID: <1448706409-16912-1-git-send-email-sebastian.hesselbarth@gmail.com>
References: <1448705645-13881-1-git-send-email-sebastian.hesselbarth@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:36509 "EHLO
	mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751098AbbK1K06 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 28 Nov 2015 05:26:58 -0500
In-Reply-To: <1448705645-13881-1-git-send-email-sebastian.hesselbarth@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Simon Guinot <simon.guinot@sequanux.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Common MVEBU pinctrl driver core gets an array of controls to modify
a specific set of registers and an array of modes for each pingroup
from each of the different SoC families of MVEBU.

Some SoC families comprise different variants that differ in available
pingroups and also controls, but to ease driver development, we can
pass a variant mask to disable specific pingroups for some variants.
However, controls are limited to the true number of pinctrl groups
avaiable on a variant.

Now, when pinctrl core driver parses over above arrays, it tries to
match modes with available controls and complains about missing
controls for modes that are passed to the core but actually are not
avaiable on a variant with:

kirkwood-pinctrl f1010000.pin-controller: unknown pinctrl group 36

This warning is a false-positive and annoying, so move the warning
after we checked the variant mask for each mode setting. Also, if
there is no supported setting for this variant, do not complain at
all.

Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Reported-by: Linus Walleij <linus.walleij@linaro.org>
---
Changelog:
v1->v2:
- modify settings loop to allow to check for !num_settings

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Simon Guinot <simon.guinot@sequanux.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Gregory Clement <gregory.clement@free-electrons.com>
Cc: linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/pinctrl/mvebu/pinctrl-mvebu.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-mvebu.c b/drivers/pinctrl/mvebu/pinctrl-mvebu.c
index 77d2221d379d..e4d473811bb3 100644
--- a/drivers/pinctrl/mvebu/pinctrl-mvebu.c
+++ b/drivers/pinctrl/mvebu/pinctrl-mvebu.c
@@ -663,28 +663,20 @@ int mvebu_pinctrl_probe(struct platform_device *pdev)
 	/* assign mpp modes to groups */
 	for (n = 0; n < soc->nmodes; n++) {
 		struct mvebu_mpp_mode *mode = &soc->modes[n];
-		struct mvebu_pinctrl_group *grp =
-			mvebu_pinctrl_find_group_by_pid(pctl, mode->pid);
+		struct mvebu_mpp_ctrl_setting *set = &mode->settings[0];
+		struct mvebu_pinctrl_group *grp;
 		unsigned num_settings;
 
-		if (!grp) {
-			dev_warn(&pdev->dev, "unknown pinctrl group %d\n",
-				mode->pid);
-			continue;
-		}
-
-		for (num_settings = 0; ;) {
-			struct mvebu_mpp_ctrl_setting *set =
-				&mode->settings[num_settings];
-
+		for (num_settings = 0; ; set++) {
 			if (!set->name)
 				break;
-			num_settings++;
 
 			/* skip unsupported settings for this variant */
 			if (pctl->variant && !(pctl->variant & set->variant))
 				continue;
 
+			num_settings++;
+
 			/* find gpio/gpo/gpi settings */
 			if (strcmp(set->name, "gpio") == 0)
 				set->flags = MVEBU_SETTING_GPI |
@@ -695,6 +687,17 @@ int mvebu_pinctrl_probe(struct platform_device *pdev)
 				set->flags = MVEBU_SETTING_GPI;
 		}
 
+		/* skip modes with no settings for this variant */
+		if (!num_settings)
+			continue;
+
+		grp = mvebu_pinctrl_find_group_by_pid(pctl, mode->pid);
+		if (!grp) {
+			dev_warn(&pdev->dev, "unknown pinctrl group %d\n",
+				mode->pid);
+			continue;
+		}
+
 		grp->settings = mode->settings;
 		grp->num_settings = num_settings;
 	}
-- 
2.1.4

