From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 2/3] gpio: max77620: Implement gpio_get_direction callback
Date: Tue, 24 May 2016 18:43:45 +0530
Message-ID: <1464095626-28424-2-git-send-email-ldewangan@nvidia.com>
References: <1464095626-28424-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464095626-28424-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-gpio@vger.kernel.org

Implement gpio_get_direction() callback for MAX77620 GPIO.
This is useful for debugfs and the userspace ABI.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 drivers/gpio/gpio-max77620.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 35f365c..0bb6d93 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/gpio/driver.h>
+#include <linux/gpio.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/max77620.h>
 #include <linux/module.h>
@@ -152,6 +153,23 @@ static int max77620_gpio_dir_output(struct gpio_chip *gc, unsigned int offset,
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
+	return (val & MAX77620_CNFG_GPIO_DIR_MASK) ?
+		GPIOF_DIR_IN : GPIOF_DIR_OUT;
+}
+
 static int max77620_gpio_set_debounce(struct gpio_chip *gc,
 				      unsigned int offset,
 				      unsigned int debounce)
@@ -236,6 +254,7 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 	mgpio->gpio_chip.direction_input = max77620_gpio_dir_input;
 	mgpio->gpio_chip.get = max77620_gpio_get;
 	mgpio->gpio_chip.direction_output = max77620_gpio_dir_output;
+	mgpio->gpio_chip.get_direction = max77620_gpio_get_direction;
 	mgpio->gpio_chip.set_debounce = max77620_gpio_set_debounce;
 	mgpio->gpio_chip.set = max77620_gpio_set;
 	mgpio->gpio_chip.to_irq = max77620_gpio_to_irq;
-- 
2.1.4
