From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 03/54] gpio: em: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:11:01 +0100
Message-ID: <1450793461-21934-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:35872 "EHLO
	mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754287AbbLVOLG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:11:06 -0500
Received: by mail-lf0-f52.google.com with SMTP id z124so125168002lfa.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:11:05 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <damm@opensource.se>
Cc: Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <damm@opensource.se>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-em.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
index c3ca2b1c1dfe..d726c68c4a65 100644
--- a/drivers/gpio/gpio-em.c
+++ b/drivers/gpio/gpio-em.c
@@ -203,7 +203,7 @@ static int em_gio_direction_input(struct gpio_chip *chip, unsigned offset)
 
 static int em_gio_get(struct gpio_chip *chip, unsigned offset)
 {
-	return (int)(em_gio_read(gpio_to_priv(chip), GIO_I) & BIT(offset));
+	return !!(em_gio_read(gpio_to_priv(chip), GIO_I) & BIT(offset));
 }
 
 static void __em_gio_set(struct gpio_chip *chip, unsigned int reg,
-- 
2.4.3

