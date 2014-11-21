From: Yunlei He <heyunlei@huawei.com>
Subject: [PATCH] gpio: pl061: hook request if gpio-ranges avaiable
Date: Fri, 21 Nov 2014 14:43:58 +0800
Message-ID: <1416552238-9908-1-git-send-email-heyunlei@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from szxga02-in.huawei.com ([119.145.14.65]:58740 "EHLO
	szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750910AbaKUGow (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Nov 2014 01:44:52 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, linus.walleij@linaro.org
Cc: bintian.wang@huawei.com, peifeiyue@huawei.com, haojian.zhuang@linaro.org, Yunlei He <heyunlei@huawei.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>

Gpio-ranges property is useful to represent which GPIOs correspond
to which pins on which pin controllers. But there may be some gpios
without pinctrl operation. So check whether gpio-ranges property
exists in device node first.

Signed-off-by: Yunlei He <heyunlei@huawei.com>
Signed-off-by: Xinwei Kong <kong.kongxinwei@hisilicon.com>
Signed-off-by: Haojian Zhuang <haojian.zhuang@linaro.org>
---
 Documentation/devicetree/bindings/gpio/pl061-gpio.txt | 2 +-
 drivers/gpio/gpio-pl061.c                             | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/pl061-gpio.txt b/Documentation/devicetree/bindings/gpio/pl061-gpio.txt
index a2c416b..577bcf7 100644
--- a/Documentation/devicetree/bindings/gpio/pl061-gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/pl061-gpio.txt
@@ -7,4 +7,4 @@ Required properties:
   - bit 0 specifies polarity (0 for normal, 1 for inverted)
 - gpio-controller : Marks the device node as a GPIO controller.
 - interrupts : Interrupt mapping for GPIO IRQ.
-
+- gpio-ranges : Interaction with the PINCTRL subsystem
diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 84b49cf..01875d1 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -24,6 +24,7 @@
 #include <linux/slab.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pm.h>
+#include <linux/of_address.h>
 
 #define GPIODIR 0x400
 #define GPIOIS  0x404
@@ -263,9 +264,11 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 		return PTR_ERR(chip->base);
 
 	spin_lock_init(&chip->lock);
+	if (of_get_property(dev->of_node, "gpio-ranges", NULL)) {
+		chip->gc.request = pl061_gpio_request;
+		chip->gc.free = pl061_gpio_free;
+	}
 
-	chip->gc.request = pl061_gpio_request;
-	chip->gc.free = pl061_gpio_free;
 	chip->gc.direction_input = pl061_direction_input;
 	chip->gc.direction_output = pl061_direction_output;
 	chip->gc.get = pl061_get_value;
-- 
1.9.1


