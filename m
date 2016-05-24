From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 3/3] gpio: max77620: use the new open drain callback
Date: Tue, 24 May 2016 18:43:46 +0530
Message-ID: <1464095626-28424-3-git-send-email-ldewangan@nvidia.com>
References: <1464095626-28424-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464095626-28424-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-gpio@vger.kernel.org

The MAX77620 have a GPIO pins which can act as open drain or
push pull mode. Implement support for controlling this from GPIO
descriptor tables or other hardware descriptions such as
device tree by implementing the .set_single_ended() callback.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 drivers/gpio/gpio-max77620.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 0bb6d93..d21d38f 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -220,6 +220,28 @@ static void max77620_gpio_set(struct gpio_chip *gc, unsigned int offset,
 		dev_err(mgpio->dev, "CNFG_GPIO_OUT update failed: %d\n", ret);
 }
 
+static int max77620_gpio_set_single_ended(struct gpio_chip *gc,
+					  unsigned int offset,
+					  enum single_ended_mode mode)
+{
+	struct max77620_gpio *mgpio = gpiochip_get_data(gc);
+
+	switch (mode) {
+	case LINE_MODE_OPEN_DRAIN:
+		return regmap_update_bits(mgpio->rmap, GPIO_REG_ADDR(offset),
+					  MAX77620_CNFG_GPIO_DRV_MASK,
+					  MAX77620_CNFG_GPIO_DRV_OPENDRAIN);
+	case LINE_MODE_PUSH_PULL:
+		return regmap_update_bits(mgpio->rmap, GPIO_REG_ADDR(offset),
+					  MAX77620_CNFG_GPIO_DRV_MASK,
+					  MAX77620_CNFG_GPIO_DRV_PUSHPULL);
+	default:
+		break;
+	}
+
+	return -ENOTSUPP;
+}
+
 static int max77620_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
 {
 	struct max77620_gpio *mgpio = gpiochip_get_data(gc);
@@ -257,6 +279,7 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 	mgpio->gpio_chip.get_direction = max77620_gpio_get_direction;
 	mgpio->gpio_chip.set_debounce = max77620_gpio_set_debounce;
 	mgpio->gpio_chip.set = max77620_gpio_set;
+	mgpio->gpio_chip.set_single_ended = max77620_gpio_set_single_ended;
 	mgpio->gpio_chip.to_irq = max77620_gpio_to_irq;
 	mgpio->gpio_chip.ngpio = MAX77620_GPIO_NR;
 	mgpio->gpio_chip.can_sleep = 1;
-- 
2.1.4
