From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V2] gpio: max77620: Implement gpio_get_direction callback
Date: Tue, 31 May 2016 18:34:35 +0530
Message-ID: <1464699875-6641-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:3765 "EHLO
	hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753290AbcEaNRQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 31 May 2016 09:17:16 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>

Implement gpio_get_direction() callback for MAX77620 GPIO.
This is useful for debugfs and the userspace ABI.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
Changes from V1:
Earlier it was part of series to implement get_directiona dn set_single_mode.
Other patches are alreadya pplied and hence making this as single patch.
On this patch:
- remove the inclusion of gpio.h
- Do not use GPIOF flags.

 drivers/gpio/gpio-max77620.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 8658c32..3f34b52 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -152,6 +152,22 @@ static int max77620_gpio_dir_output(struct gpio_chip *gc, unsigned int offset,
 	return ret;
 }
 
+static int max77620_gpio_get_direction(struct gpio_chip *gc,
+				       unsigned int offset)
+{
+	struct max77620_gpio *mgpio = gpiochip_get_data(gc);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(mgpio->rmap, GPIO_REG_ADDR(offset), &val);
+	if (ret < 0) {
+		dev_err(mgpio->dev, "GPIO register read failed: %d\n", ret);
+		return ret;
+	}
+
+	return !!(val & MAX77620_CNFG_GPIO_DIR_MASK);
+}
+
 static int max77620_gpio_set_debounce(struct gpio_chip *gc,
 				      unsigned int offset,
 				      unsigned int debounce)
@@ -258,6 +274,7 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 	mgpio->gpio_chip.direction_input = max77620_gpio_dir_input;
 	mgpio->gpio_chip.get = max77620_gpio_get;
 	mgpio->gpio_chip.direction_output = max77620_gpio_dir_output;
+	mgpio->gpio_chip.get_direction = max77620_gpio_get_direction;
 	mgpio->gpio_chip.set_debounce = max77620_gpio_set_debounce;
 	mgpio->gpio_chip.set = max77620_gpio_set;
 	mgpio->gpio_chip.set_single_ended = max77620_gpio_set_single_ended;
-- 
2.1.4

