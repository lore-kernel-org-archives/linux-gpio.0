From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH] gpio: pxa: fix legacy non pinctrl aware builds
Date: Tue, 29 Mar 2016 10:04:00 +0200
Message-ID: <1459238640-29243-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:37184 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753441AbcC2IEI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Mar 2016 04:04:08 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

In legacy pxa builds, ie. non device-tree and platform-data only builds,
pinctrl is not yet available. As a consequence, the pinctrl gpio
direction change function is a stub, returning always success.

In the current state, the gpio driver direction function believes the
pinctrl direction change was successful, and exits without actually
changing the gpio direction.

This patch changes the logic :
 - if the pinctrl direction function fails, gpio direction will report
   that failure
 - if the pinctrl direction function succeeds, gpio direction is changed
   by the gpio driver anyway.
   This is sub optimal in the pinctrl aware case, as the gpio direction
   will be changed twice: once by pinctrl function and another time by
   the gpio direction function.

Yet it should be acceptable in this form, as this is functional for all
pxa platforms (device-tree and platform-data), and moreover changing a
gpio direction is very very seldom, usually in machine initialization,
seldom in drivers probe, and an exception for ac97 reset bug.

Fixes: a770d946371e ("gpio: pxa: add pin control gpio direction and request")
Reported-by: Guenter Roeck <guenter@roeck-us.net>
Tested-by: Guenter Roeck <guenter@roeck-us.net>
Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/gpio/gpio-pxa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 20267d8ff858..4d54e56fbb6a 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -283,8 +283,8 @@ static int pxa_gpio_direction_output(struct gpio_chip *chip,
 	writel_relaxed(mask, base + (value ? GPSR_OFFSET : GPCR_OFFSET));
 
 	ret = pinctrl_gpio_direction_output(chip->base + offset);
-	if (!ret)
-		return 0;
+	if (ret)
+		return ret;
 
 	spin_lock_irqsave(&gpio_lock, flags);
 
-- 
2.1.4

