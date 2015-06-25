From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH] gpio: omap: prevent module from being unloaded while in use
Date: Thu, 25 Jun 2015 18:13:33 +0300
Message-ID: <1435245213-17858-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:44789 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751337AbbFYPN7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 25 Jun 2015 11:13:59 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, tony@atomide.com
Cc: Sekhar Nori <nsekhar@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Javier Martinez Canillas <javier@dowhile0.org>, linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>

OMAP GPIO driver allowed to be built as loadable module, but it
doesn't set owner field in GPIO chip structure. As result,
module_get/put() API is not working and it's possible to unload
OMAP driver while in use:

  omap_gpio 48051000.gpio: REMOVING GPIOCHIP WITH GPIOS STILL REQUESTED

Hence, add missing configuration.

Cc: Tony Lindgren <tony@atomide.com>
Fixes: cac089f9026e ('gpio: omap: Allow building as a loadable module')
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
Hi Linus,

Seems this one is for 4.2-rc.

 drivers/gpio/gpio-omap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index a0ad803..61a731f 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -1187,6 +1187,7 @@ static int omap_gpio_probe(struct platform_device *pdev)
 	bank->irq = res->start;
 	bank->dev = dev;
 	bank->chip.dev = dev;
+	bank->chip.owner = THIS_MODULE;
 	bank->dbck_flag = pdata->dbck_flag;
 	bank->stride = pdata->bank_stride;
 	bank->width = pdata->bank_width;
-- 
2.4.4

