From: "Markus Mayer" <markus.mayer@linaro.org>
Subject: [PATCH] gpio: bcm281xx: Fix return value of bcm_kona_gpio_get()
Date: Fri, 8 Nov 2013 10:31:04 -0800
Message-ID: <1383935464-3484-1-git-send-email-markus.mayer@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mms3.broadcom.com ([216.31.210.19]:3593 "EHLO mms3.broadcom.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757371Ab3KHSbL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 8 Nov 2013 13:31:11 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linaro Patches <patches@linaro.org>, Alexandre Courbot <acourbot@nvidia.com>, Linux GPIO List <linux-gpio@vger.kernel.org>, Markus Mayer <markus.mayer@linaro.org>

We need to return the corresponding bit (0 or 1) for a particular GPIO.

Signed-off-by: Markus Mayer <markus.mayer@linaro.org>
Reviewed-by: Tim Kryger <tim.kryger@linaro.org>
---

Without this change, the driver doesn't work in all cases as it should.

 drivers/gpio/gpio-bcm-kona.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index 72c927d..db473f1 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -158,7 +158,7 @@ static int bcm_kona_gpio_get(struct gpio_chip *chip, unsigned gpio)
 	spin_unlock_irqrestore(&kona_gpio->lock, flags);
 
 	/* return the specified bit status */
-	return !!(val & bit);
+	return (val >> bit) & 1;
 }
 
 static int bcm_kona_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
-- 
1.7.9.5


