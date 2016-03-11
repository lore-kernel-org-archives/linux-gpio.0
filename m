From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: pca953x: Fix pca953x_gpio_set_multiple() on 64-bit
Date: Fri, 11 Mar 2016 17:31:27 +0100
Message-ID: <1457713887-7748-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:48517 "EHLO
	baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932264AbcCKQba (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Mar 2016 11:31:30 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Phil Reid <preid@electromag.com.au>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

pca953x_gpio_set_multiple() divides by 4 to convert from longs to bytes,
which assumes a 32-bit platform, and is not correct on 64-bit platforms.
Use "sizeof(...)" instead to fix this.

Fixes: b4818afeacbd8182 ("gpio: pca953x: Add set_multiple to allow multiple bits to be set in one write.")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Untested, found by code inspection.

This bug was introduced in v4.5-rc1, but unless Linus (the other one ;-)
will make a v4.5-rc8, it's probably too late to get this fixed in v4.5.
---
 drivers/gpio/gpio-pca953x.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 23196c5fc17ceb6b..99b375c959987fe9 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -367,9 +367,11 @@ static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
 	memcpy(reg_val, chip->reg_output, NBANK(chip));
 	mutex_lock(&chip->i2c_lock);
 	for(bank=0; bank<NBANK(chip); bank++) {
-		unsigned bankmask = mask[bank/4] >> ((bank % 4) * 8);
+		unsigned bankmask = mask[bank / sizeof(*mask)] >>
+				    ((bank % sizeof(*mask)) * 8);
 		if(bankmask) {
-			unsigned bankval  = bits[bank/4] >> ((bank % 4) * 8);
+			unsigned bankval  = bits[bank / sizeof(*bits)] >>
+					    ((bank % sizeof(*bits)) * 8);
 			reg_val[bank] = (reg_val[bank] & ~bankmask) | bankval;
 		}
 	}
-- 
1.9.1

