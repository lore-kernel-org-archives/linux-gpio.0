From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: tc3589x: fix up .get_direction()
Date: Mon, 14 Nov 2016 15:10:29 +0100
Message-ID: <1479132629-24067-1-git-send-email-linus.walleij@linaro.org>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, stable@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The bit in the TC3589x direction register is 0 for input
and 1 for output, but the gpiolib expects the reverse.
Fix up the logic.

Cc: stable@vger.kernel.org
Fixes: 14063d71e5e6 ("gpio: tc3589x: add .get_direction() and small cleanup")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-tc3589x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
index 65d380b2bad2..94ec262a99e0 100644
--- a/drivers/gpio/gpio-tc3589x.c
+++ b/drivers/gpio/gpio-tc3589x.c
@@ -97,7 +97,7 @@ static int tc3589x_gpio_get_direction(struct gpio_chip *chip,
 	if (ret < 0)
 		return ret;
 
-	return !!(ret & BIT(pos));
+	return !(ret & BIT(pos));
 }
 
 static int tc3589x_gpio_set_single_ended(struct gpio_chip *chip,
-- 
2.7.4
