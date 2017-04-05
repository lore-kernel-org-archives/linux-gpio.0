From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH] gpio: arizona: Correct handling for reading input GPIOs
Date: Wed, 5 Apr 2017 16:50:46 +0100
Message-ID: <1491407446-5891-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:45347 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S933010AbdDEPtt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Apr 2017 11:49:49 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: gnurou@gmail.com, linux-gpio@vger.kernel.org, patches@opensource.wolfsonmicro.com

The GPIO register is cached since all the configuration resides within
it, however, this means for input GPIOs the driver will not return the
actual state but the last value written to the register cache.

To correct this in the case of reading an input GPIO resume the CODEC
and drop the cache for the input register to ensure an actual hardware
read takes place.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 drivers/gpio/gpio-arizona.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-arizona.c b/drivers/gpio/gpio-arizona.c
index 1f91557..60b3102 100644
--- a/drivers/gpio/gpio-arizona.c
+++ b/drivers/gpio/gpio-arizona.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/gpio.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/seq_file.h>
 
 #include <linux/mfd/arizona/core.h>
@@ -41,13 +42,38 @@ static int arizona_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
 	struct arizona_gpio *arizona_gpio = gpiochip_get_data(chip);
 	struct arizona *arizona = arizona_gpio->arizona;
-	unsigned int val;
+	unsigned int reg, val;
 	int ret;
 
-	ret = regmap_read(arizona->regmap, ARIZONA_GPIO1_CTRL + offset, &val);
+	reg = ARIZONA_GPIO1_CTRL + offset;
+	ret = regmap_read(arizona->regmap, reg, &val);
 	if (ret < 0)
 		return ret;
 
+	/* Resume to read actual registers for input pins */
+	if (!(val & ARIZONA_GPN_DIR)) {
+		ret = pm_runtime_get_sync(chip->parent);
+		if (ret < 0) {
+			dev_err(chip->parent, "Failed to resume: %d\n", ret);
+			return ret;
+		}
+
+		/* Register is cached, drop it to ensure a physical read */
+		ret = regcache_drop_region(arizona->regmap, reg, reg);
+		if (ret < 0) {
+			dev_err(chip->parent, "Failed to drop cache: %d\n",
+				ret);
+			return ret;
+		}
+
+		ret = regmap_read(arizona->regmap, reg, &val);
+		if (ret < 0)
+			return ret;
+
+		pm_runtime_mark_last_busy(chip->parent);
+		pm_runtime_put_autosuspend(chip->parent);
+	}
+
 	if (val & ARIZONA_GPN_LVL)
 		return 1;
 	else
-- 
2.1.4

