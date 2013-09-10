From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 6/7] ARM: ixp4: delete irq_to_gpio
Date: Tue, 10 Sep 2013 14:31:35 +0200
Message-ID: <1378816295-8205-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f178.google.com ([209.85.217.178]:41475 "EHLO
	mail-lb0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751225Ab3IJMbo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Sep 2013 08:31:44 -0400
Received: by mail-lb0-f178.google.com with SMTP id z5so6161923lbh.37
        for <linux-gpio@vger.kernel.org>; Tue, 10 Sep 2013 05:31:43 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khc@pm.waw.pl>
Cc: Alexandre Courbot <acourbot@nvidia.com>, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>

This dangerous function is not used in the kernel, so let's
just delete it.

Cc: Imre Kaloz <kaloz@openwrt.org>
Cc: Krzysztof Halasa <khc@pm.waw.pl>
Cc: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-ixp4xx/common.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/arm/mach-ixp4xx/common.c b/arch/arm/mach-ixp4xx/common.c
index 5327dec..8708ac8 100644
--- a/arch/arm/mach-ixp4xx/common.c
+++ b/arch/arm/mach-ixp4xx/common.c
@@ -117,17 +117,6 @@ static int ixp4xx_gpio_to_irq(struct gpio_chip *chip, unsigned gpio)
 	return -EINVAL;
 }
 
-int irq_to_gpio(unsigned int irq)
-{
-	int gpio = (irq < 32) ? irq2gpio[irq] : -EINVAL;
-
-	if (gpio == -1)
-		return -EINVAL;
-
-	return gpio;
-}
-EXPORT_SYMBOL(irq_to_gpio);
-
 static int ixp4xx_set_irq_type(struct irq_data *d, unsigned int type)
 {
 	int line = irq2gpio[d->irq];
-- 
1.8.3.1

