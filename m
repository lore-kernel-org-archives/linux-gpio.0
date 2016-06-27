From: Venkat Reddy Talla <vreddytalla@nvidia.com>
Subject: [PATCH 1/1] gpio: max77620: get gpio value based on direction
Date: Mon, 27 Jun 2016 16:26:24 +0530
Message-ID: <1467024984-28138-1-git-send-email-vreddytalla@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from nat-hk.nvidia.com ([203.18.50.4]:12016 "EHLO
	hkmmgate101.nvidia.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751511AbcF0K4q (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jun 2016 06:56:46 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: ldewangan@nvidia.com, vreddytalla@nvidia.com

Gpio direction is determined by DIRx bit of GPIO
configuration register, return max77620 gpio value
based on direction in or out.

Signed-off-by: Venkat Reddy Talla <vreddytalla@nvidia.com>
---
 drivers/gpio/gpio-max77620.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 8658c32..b46b436 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -123,7 +123,10 @@ static int max77620_gpio_get(struct gpio_chip *gc, unsigned int offset)
 		return ret;
 	}
 
-	return !!(val & MAX77620_CNFG_GPIO_INPUT_VAL_MASK);
+	if  (val & MAX77620_CNFG_GPIO_DIR_MASK)
+		return !!(val & MAX77620_CNFG_GPIO_INPUT_VAL_MASK);
+	else
+		return !!(val & MAX77620_CNFG_GPIO_OUTPUT_VAL_MASK);
 }
 
 static int max77620_gpio_dir_output(struct gpio_chip *gc, unsigned int offset,
-- 
2.1.4

