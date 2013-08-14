From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH] gpio-pca953x: Fix read for chips with more than 8 gpios
Date: Wed, 14 Aug 2013 16:20:38 +0200
Message-ID: <1376490038-32382-1-git-send-email-ricardo.ribalda@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
List-Id: linux-gpio@vger.kernel.org

pca953x_read_single returns ONLY the value of the 8 inputs of the
same bank.

off can have a value from 0 to 15, therefore we have to find the
offset of that gpio within that bank.

Without this patch gpios 8-15 will always be read as zero.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 drivers/gpio/gpio-pca953x.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 426c51d..1a7ab13 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -308,7 +308,7 @@ static int pca953x_gpio_get_value(struct gpio_chip *gc, unsigned off)
 		return 0;
 	}
 
-	return (reg_val & (1u << off)) ? 1 : 0;
+	return (reg_val & (1u << (off % BANK_SZ))) ? 1 : 0;
 }
 
 static void pca953x_gpio_set_value(struct gpio_chip *gc, unsigned off, int val)
-- 
1.7.10.4
