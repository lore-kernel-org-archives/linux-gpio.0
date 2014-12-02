From: Yunlei He <heyunlei@huawei.com>
Subject: [PATCH 1/2] gpio: pl061: hook request if gpio-ranges avaiable
Date: Tue, 2 Dec 2014 12:32:59 +0800
Message-ID: <1417494780-3704-2-git-send-email-heyunlei@huawei.com>
References: <1417494780-3704-1-git-send-email-heyunlei@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from [119.145.14.66] ([119.145.14.66]:11986 "EHLO
	szxga03-in.huawei.com" rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org
	with ESMTP id S1754158AbaLBEd5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Dec 2014 23:33:57 -0500
In-Reply-To: <1417494780-3704-1-git-send-email-heyunlei@huawei.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: haojian.zhuang@linaro.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: bintian.wang@huawei.com, peifeiyue@huawei.com, liguozhu@hisilicon.com, Yunlei He <heyunlei@huawei.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>

Gpio-ranges property is useful to represent which GPIOs correspond
to which pins on which pin controllers. But there may be some gpios
without pinctrl operation. So check whether gpio-ranges property
exists in device node first.

Signed-off-by: Yunlei He <heyunlei@huawei.com>
Signed-off-by: Xinwei Kong <kong.kongxinwei@hisilicon.com>
Signed-off-by: Haojian Zhuang <haojian.zhuang@linaro.org>
---
 drivers/gpio/gpio-pl061.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 84b49cf..15d1885 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -52,28 +52,34 @@ struct pl061_gpio {
 
 	void __iomem		*base;
 	struct gpio_chip	gc;
+	bool			uses_pinctrl;
 
 #ifdef CONFIG_PM
 	struct pl061_context_save_regs csave_regs;
 #endif
 };
 
-static int pl061_gpio_request(struct gpio_chip *chip, unsigned offset)
+static int pl061_gpio_request(struct gpio_chip *gc, unsigned offset)
 {
 	/*
 	 * Map back to global GPIO space and request muxing, the direction
 	 * parameter does not matter for this controller.
 	 */
-	int gpio = chip->base + offset;
+	struct pl061_gpio *chip = container_of(gc, struct pl061_gpio, gc);
+	int gpio = gc->base + offset;
 
-	return pinctrl_request_gpio(gpio);
+	if (chip->uses_pinctrl)
+		return pinctrl_request_gpio(gpio);
+	return 0;
 }
 
-static void pl061_gpio_free(struct gpio_chip *chip, unsigned offset)
+static void pl061_gpio_free(struct gpio_chip *gc, unsigned offset)
 {
-	int gpio = chip->base + offset;
+	struct pl061_gpio *chip = container_of(gc, struct pl061_gpio, gc);
+	int gpio = gc->base + offset;
 
-	pinctrl_free_gpio(gpio);
+	if (chip->uses_pinctrl)
+		pinctrl_free_gpio(gpio);
 }
 
 static int pl061_direction_input(struct gpio_chip *gc, unsigned offset)
@@ -263,6 +269,8 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 		return PTR_ERR(chip->base);
 
 	spin_lock_init(&chip->lock);
+	if (of_property_read_bool(dev->of_node, "gpio-ranges"))
+		chip->uses_pinctrl = true;
 
 	chip->gc.request = pl061_gpio_request;
 	chip->gc.free = pl061_gpio_free;
-- 
1.9.1


