From: Martin Schiller <mschiller@tdt.de>
Subject: [PATCH v4] pinctrl/lantiq: Implement gpio_chip.to_irq
Date: Fri, 4 Dec 2015 11:05:44 +0100
Message-ID: <1449223544-3527-1-git-send-email-mschiller@tdt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mxout51.expurgate.net ([194.37.255.51]:57278 "EHLO
	mxout51.expurgate.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755177AbbLDKGG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Dec 2015 05:06:06 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, blogic@openwrt.org, hauke@hauke-m.de, jogo@openwrt.org, daniel.schwierzeck@gmail.com, Martin Schiller <mschiller@tdt.de>

From: John Crispin <blogic@openwrt.org>

Some drivers require a way to translate GPIO pins to their IRQ numbers.

This patch adds the .to_irq() gpiolib callback to the pinctrl-xway
driver, which returns an IRQ mapping for a given GPIO pin.

Signed-off-by: John Crispin <blogic@openwrt.org>
Signed-off-by: Martin Schiller <mschiller@tdt.de>
---
Changes in v4:
- Added commit message + comment 

Changes in v3:
- Moved this change into a separate patch

Changes in v2: 
None

 drivers/pinctrl/pinctrl-xway.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-xway.c b/drivers/pinctrl/pinctrl-xway.c
index b78baaa..66f0048 100644
--- a/drivers/pinctrl/pinctrl-xway.c
+++ b/drivers/pinctrl/pinctrl-xway.c
@@ -1573,6 +1573,22 @@ static int xway_gpio_dir_out(struct gpio_chip *chip, unsigned int pin, int val)
 	return 0;
 }
 
+/*
+ * gpiolib gpiod_to_irq callback function.
+ * Returns the mapped IRQ (external interrupt) number for a given GPIO pin.
+ */
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
@@ -1581,6 +1597,7 @@ static struct gpio_chip xway_chip = {
 	.set = xway_gpio_set,
 	.request = gpiochip_generic_request,
 	.free = gpiochip_generic_free,
+	.to_irq = xway_gpio_to_irq,
 	.base = -1,
 };
 
-- 
2.1.4

