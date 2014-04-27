From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: [PATCH 1/4] gpio: em: use BIT() macro instead manually shifting bits
Date: Sun, 27 Apr 2014 02:00:47 +0200
Message-ID: <1398556850-27751-2-git-send-email-javier@dowhile0.org>
References: <1398556850-27751-1-git-send-email-javier@dowhile0.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-we0-f177.google.com ([74.125.82.177]:43168 "EHLO
	mail-we0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752618AbaD0ABE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 26 Apr 2014 20:01:04 -0400
Received: by mail-we0-f177.google.com with SMTP id t60so3113006wes.8
        for <linux-gpio@vger.kernel.org>; Sat, 26 Apr 2014 17:01:03 -0700 (PDT)
In-Reply-To: <1398556850-27751-1-git-send-email-javier@dowhile0.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, linux-gpio@vger.kernel.org, inux-omap@vger.kernel.org, Javier Martinez Canillas <javier@dowhile0.org>

Using the BIT() macro instead of manually shifting bits
makes the code less error prone and also more readable.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 drivers/gpio/gpio-em.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
index 8765bd6..1da1aa4 100644
--- a/drivers/gpio/gpio-em.c
+++ b/drivers/gpio/gpio-em.c
@@ -212,7 +212,7 @@ static void __em_gio_set(struct gpio_chip *chip, unsigned int reg,
 {
 	/* upper 16 bits contains mask and lower 16 actual value */
 	em_gio_write(gpio_to_priv(chip), reg,
-		     (1 << (shift + 16)) | (value << shift));
+		     (BIT(shift + 16)) | (value << shift));
 }
 
 static void em_gio_set(struct gpio_chip *chip, unsigned offset, int value)
-- 
1.9.1

