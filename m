From: Vladimir Murzin <vladimir.murzin@arm.com>
Subject: [PATCH] gpio: syscon: do not use raw "set" callback in syscon_gpio_dir_out
Date: Wed, 30 Aug 2017 15:50:41 +0100
Message-ID: <1504104641-8369-1-git-send-email-vladimir.murzin@arm.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:45752 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751372AbdH3Ouz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Aug 2017 10:50:55 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, grygorii.strashko@ti.com

"set" callback is optional and can be NULL, instead use chip->set
which always points at proper callback function.

Fixes 2c341d62eb4b ("gpio: syscon: add soc specific callback to assign output value")

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 drivers/gpio/gpio-syscon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-syscon.c b/drivers/gpio/gpio-syscon.c
index 537cec7..cf88a0b 100644
--- a/drivers/gpio/gpio-syscon.c
+++ b/drivers/gpio/gpio-syscon.c
@@ -122,7 +122,7 @@ static int syscon_gpio_dir_out(struct gpio_chip *chip, unsigned offset, int val)
 				   BIT(offs % SYSCON_REG_BITS));
 	}
 
-	priv->data->set(chip, offset, val);
+	chip->set(chip, offset, val);
 
 	return 0;
 }
-- 
1.9.1

