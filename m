From: Neil Zhang <zhangwm@marvell.com>
Subject: [PATCH] gpio: pxa: normalize the return value for gpio_get
Date: Fri, 10 Jan 2014 14:03:03 +0800
Message-ID: <1389333783-3372-1-git-send-email-zhangwm@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174]:37969 "EHLO
	mx0a-0016f401.pphosted.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750800AbaAJGDH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Fri, 10 Jan 2014 01:03:07 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Neil Zhang <zhangwm@marvell.com>

It would be convenient to normalize the return value for gpio_get.

I have checked mach-mmp / mach-pxa / plat-pxa / plat-orion / mach-orion5x.
It's OK for all of them to change this function to return 0 and 1.

Signed-off-by: Neil Zhang <zhangwm@marvell.com>
---
 drivers/gpio/gpio-pxa.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index cc13d1b..42e6e64 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -263,7 +263,8 @@ static int pxa_gpio_direction_output(struct gpio_chip *chip,
 
 static int pxa_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	return readl_relaxed(gpio_chip_base(chip) + GPLR_OFFSET) & (1 << offset);
+	u32 gplr = readl_relaxed(gpio_chip_base(chip) + GPLR_OFFSET);
+	return !!(gplr & (1 << offset));
 }
 
 static void pxa_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
-- 
1.7.9.5

