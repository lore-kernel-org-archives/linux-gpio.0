From: "Markus Mayer" <markus.mayer@linaro.org>
Subject: [PATCH v3] gpio: bcm281xx: Fix return value of
 bcm_kona_gpio_get()
Date: Thu, 21 Nov 2013 15:12:46 -0800
Message-ID: <1385075566-23989-1-git-send-email-markus.mayer@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mms3.broadcom.com ([216.31.210.19]:1911 "EHLO mms3.broadcom.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754000Ab3KUXM6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 21 Nov 2013 18:12:58 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linaro Patches <patches@linaro.org>, Alexandre Courbot <acourbot@nvidia.com>, Linux GPIO List <linux-gpio@vger.kernel.org>, Tim Kryger <tim.kryger@linaro.org>, Markus Mayer <markus.mayer@linaro.org>

We need to return the corresponding bit for a particular GPIO. This bit
contains shift not mask.

Signed-off-by: Markus Mayer <markus.mayer@linaro.org>
Reviewed-by: Tim Kryger <tim.kryger@linaro.org>
Reviewed-by: Matt Porter <matt.porter@linaro.org>
---

Changes since v2:
-----------------

Use 
	return !!(val & BIT(bit));
rather than
	return (val >> bit) & 1;

Changes since v1:
-----------------

Clarified commit message


 drivers/gpio/gpio-bcm-kona.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index 72c927d..54c18c2 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -158,7 +158,7 @@ static int bcm_kona_gpio_get(struct gpio_chip *chip, unsigned gpio)
 	spin_unlock_irqrestore(&kona_gpio->lock, flags);
 
 	/* return the specified bit status */
-	return !!(val & bit);
+	return !!(val & BIT(bit));
 }
 
 static int bcm_kona_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
-- 
1.7.9.5


