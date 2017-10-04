From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: rcar: Use of_device_get_match_data() helper
Date: Wed,  4 Oct 2017 14:16:16 +0200
Message-ID: <1507119376-12491-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:44244 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751699AbdJDMQV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Oct 2017 08:16:21 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

Use the of_device_get_match_data() helper instead of open coding.
Note that the gpio-rcar driver is used with DT only, so there's always a
valid match.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpio-rcar.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 1f0871553fd20d0f..de5c010e69266264 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -24,6 +24,7 @@
 #include <linux/irq.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -393,16 +394,11 @@ MODULE_DEVICE_TABLE(of, gpio_rcar_of_table);
 static int gpio_rcar_parse_dt(struct gpio_rcar_priv *p, unsigned int *npins)
 {
 	struct device_node *np = p->pdev->dev.of_node;
-	const struct of_device_id *match;
 	const struct gpio_rcar_info *info;
 	struct of_phandle_args args;
 	int ret;
 
-	match = of_match_node(gpio_rcar_of_table, np);
-	if (!match)
-		return -EINVAL;
-
-	info = match->data;
+	info = of_device_get_match_data(&p->pdev->dev);
 
 	ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3, 0, &args);
 	*npins = ret == 0 ? args.args[2] : RCAR_MAX_GPIO_PER_BANK;
-- 
2.7.4

