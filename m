From: John Crispin <blogic@openwrt.org>
Subject: [PATCH 3/3] pinctrl: lantiq: add a to_irq callback
Date: Mon,  4 Jan 2016 22:27:59 +0100
Message-ID: <1451942879-43265-3-git-send-email-blogic@openwrt.org>
References: <1451942879-43265-1-git-send-email-blogic@openwrt.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from arrakis.dune.hu ([78.24.191.176]:42099 "EHLO arrakis.dune.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751913AbcADV2Z (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 4 Jan 2016 16:28:25 -0500
In-Reply-To: <1451942879-43265-1-git-send-email-blogic@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

The callback is missing so lets add it.

Signed-off-by: John Crispin <blogic@openwrt.org>
---
 drivers/pinctrl/pinctrl-xway.c |   13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-xway.c b/drivers/pinctrl/pinctrl-xway.c
index 434567b..3777f2d 100644
--- a/drivers/pinctrl/pinctrl-xway.c
+++ b/drivers/pinctrl/pinctrl-xway.c
@@ -686,6 +686,18 @@ static int xway_gpio_dir_out(struct gpio_chip *chip, unsigned int pin, int val)
 	return 0;
 }
 
+static int xway_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
+{
+	struct ltq_pinmux_info *info = dev_get_drvdata(chip->dev);
+	int i;
+
+	for (i = 0; i < info->num_exin; i++)
+		if (info->exin[i] == offset)
+			return ltq_eiu_get_irq(i);
+
+	return -1;
+}
+
 static struct gpio_chip xway_chip = {
 	.label = "gpio-xway",
 	.direction_input = xway_gpio_dir_in,
@@ -694,6 +706,7 @@ static struct gpio_chip xway_chip = {
 	.set = xway_gpio_set,
 	.request = gpiochip_generic_request,
 	.free = gpiochip_generic_free,
+	.to_irq = xway_gpio_to_irq,
 	.base = -1,
 };
 
-- 
1.7.10.4
