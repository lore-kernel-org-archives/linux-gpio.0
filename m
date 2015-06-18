From: Vitaly Andrianov <vitalya@ti.com>
Subject: [PATCH] gpio/davinci: add interrupt support for GPIOs 16-31
Date: Thu, 18 Jun 2015 13:10:49 -0400
Message-ID: <1434647449-5393-1-git-send-email-vitalya@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:46148 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755974AbbFRRGj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 18 Jun 2015 13:06:39 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Vitaly Andrianov <vitalya@ti.com>, Reece Pollack <x0183204@ti.com>

Interrupts for GPIOs 16 through 31 are enabled by bit 1 in the
"binten" register (offset 8). Previous versions of GPIO only
used bit 0, which enables GPIO 0-15 interrupts.

Signed-off-by: Reece Pollack <x0183204@ti.com>
Signed-off-by: Vitaly Andrianov <vitalya@ti.com>
---
 drivers/gpio/gpio-davinci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index c5e05c8..c90629f 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -546,6 +546,8 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 		chips[0].gpio_irq = bank_irq;
 		chips[0].gpio_unbanked = pdata->gpio_unbanked;
 		binten = BIT(0);
+		if (pdata->gpio_unbanked > 16)
+			binten |= BIT(1);
 
 		/* AINTC handles mask/unmask; GPIO handles triggering */
 		irq = bank_irq;
-- 
1.9.1

