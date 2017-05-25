From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: [PATCH] pinctrl: amd: don't load pinctrl-amd on Gigabyte AM4 boards
Date: Thu, 25 May 2017 12:00:06 +0800
Message-ID: <20170525040006.22654-1-kai.heng.feng@canonical.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:59156 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750744AbdEYEAS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 May 2017 00:00:18 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Kai-Heng Feng <kai.heng.feng@canonical.com>

On Gigabyte AM4 boards, pinctrl-amd generates tons of irq, makes the
system not able to boot properly.

Don't load the module until Gigabyte fixes the issue.

BugLink: https://bugs.launchpad.net/bugs/1671360
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 drivers/pinctrl/pinctrl-amd.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 1482d132fbb8..5b015d3552b8 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -29,6 +29,7 @@
 #include <linux/interrupt.h>
 #include <linux/list.h>
 #include <linux/bitops.h>
+#include <linux/dmi.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinconf-generic.h>
 
@@ -739,6 +740,26 @@ static struct pinctrl_desc amd_pinctrl_desc = {
 	.owner = THIS_MODULE,
 };
 
+static bool amd_gpio_is_gigabyte_am4(void)
+{
+	const char *board_name;
+
+	if (!dmi_match(DMI_BOARD_VENDOR, "Gigabyte Technology Co., Ltd."))
+		return false;
+
+	board_name = dmi_get_system_info(DMI_BOARD_NAME);
+
+	if (!board_name)
+		return false;
+
+	if (strstr(board_name, "A320") ||
+		strstr(board_name, "B350") ||
+		strstr(board_name, "X370"))
+		return true;
+
+	return false;
+}
+
 static int amd_gpio_probe(struct platform_device *pdev)
 {
 	int ret = 0;
@@ -746,6 +767,10 @@ static int amd_gpio_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct amd_gpio *gpio_dev;
 
+	/* Don't load this module if it's a Gigabyte AM4 board */
+	if (amd_gpio_is_gigabyte_am4())
+		return -ENODEV;
+
 	gpio_dev = devm_kzalloc(&pdev->dev,
 				sizeof(struct amd_gpio), GFP_KERNEL);
 	if (!gpio_dev)
-- 
2.13.0

