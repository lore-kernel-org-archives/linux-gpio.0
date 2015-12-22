From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 51/54] fbdev: via-gpio: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:49:41 +0100
Message-ID: <1450795781-28534-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:33084 "EHLO
	mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753466AbbLVOtq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:49:46 -0500
Received: by mail-lf0-f43.google.com with SMTP id p203so132083641lfa.0
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:49:46 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Florian Tobias Schandinat <FlorianSchandinat@gmx.de>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

As we want gpio_chip .get() calls to be able to return negative
error codes and propagate to drivers, we need to go over all
drivers and make sure their return values are clamped to [0,1].
We do this by using the ret = !!(val) design pattern.

Cc: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Tomi: as mentioned in 00/54: either apply this directly
or ACK it and I will take it into the GPIO tree.
---
 drivers/video/fbdev/via/via-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/via/via-gpio.c b/drivers/video/fbdev/via/via-gpio.c
index 6f433b8cee12..3d3544036bc1 100644
--- a/drivers/video/fbdev/via/via-gpio.c
+++ b/drivers/video/fbdev/via/via-gpio.c
@@ -142,7 +142,7 @@ static int via_gpio_get(struct gpio_chip *chip, unsigned int nr)
 	gpio = cfg->active_gpios[nr];
 	reg = via_read_reg(VIASR, gpio->vg_port_index);
 	spin_unlock_irqrestore(&cfg->vdev->reg_lock, flags);
-	return reg & (0x04 << gpio->vg_mask_shift);
+	return !!(reg & (0x04 << gpio->vg_mask_shift));
 }
 
 
-- 
2.4.3

