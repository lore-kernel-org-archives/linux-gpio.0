From: <grygorii.strashko@linaro.org>
Subject: [PATCH v2 6/8] gpio: omap: get rid of GPIO_BIT() macro
Date: Mon, 23 Mar 2015 14:18:28 +0200
Message-ID: <1427113110-20813-7-git-send-email-grygorii.strashko@linaro.org>
References: <1427113110-20813-1-git-send-email-grygorii.strashko@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f41.google.com ([209.85.215.41]:33724 "EHLO
	mail-la0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752444AbbCWMSn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Mar 2015 08:18:43 -0400
Received: by labto5 with SMTP id to5so24742067lab.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2015 05:18:41 -0700 (PDT)
In-Reply-To: <1427113110-20813-1-git-send-email-grygorii.strashko@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, ssantosh@kernel.org, Kevin Hilman <khilman@deeprootsystems.com>, tony@atomide.com
Cc: linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Grygorii Strashko <grygorii.strashko@linaro.org>

From: Grygorii Strashko <grygorii.strashko@linaro.org>

Now OMAP GPIO driver prepared for GPIO_BIT() macro removing.
Do it ;)

Tested-by: Tony Lindgren <tony@atomide.com>
Tested-by: Aaro Koskinen <aaro.koskinen@iki.fi>
Acked-by: Santosh Shilimkar <ssantosh@kernel.org>
Acked-by: Javier Martinez Canillas <javier@dowhile0.org>
Signed-off-by: Grygorii Strashko <grygorii.strashko@linaro.org>
---
 drivers/gpio/gpio-omap.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 628a132..dd7934a 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -82,7 +82,6 @@ struct gpio_bank {
 };
 
 #define GPIO_INDEX(bank, gpio) (gpio % bank->width)
-#define GPIO_BIT(bank, gpio) (BIT(GPIO_INDEX(bank, gpio)))
 #define GPIO_MOD_CTRL_BIT	BIT(0)
 
 #define BANK_USED(bank) (bank->mod_usage || bank->irq_usage)
-- 
1.9.1

