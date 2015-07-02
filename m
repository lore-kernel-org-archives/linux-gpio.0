From: Vitaly Andrianov <vitalya@ti.com>
Subject: [PATCH v2] gpio/davinci: add interrupt support for GPIOs 16-31
Date: Thu, 2 Jul 2015 14:31:30 -0400
Message-ID: <1435861890-23147-1-git-send-email-vitalya@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:37539 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752928AbbGBS1W (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jul 2015 14:27:22 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com, linus.walleij@linaro.org, nsekhar@ti.com, grygorii.strashko@ti.com, m-karicheri2@ti.com
Cc: Vitaly Andrianov <vitalya@ti.com>

Interrupts for GPIOs 16 through 31 are enabled by bit 1 in the
"binten" register (offset 8). Previous versions of GPIO only
used bit 0, which enables GPIO 0-15 interrupts.

Signed-off-by: Vitaly Andrianov <vitalya@ti.com>
Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
History

v2.
- use GENMASK to set binten. Thanks to Nori Sekhar's.

 drivers/gpio/gpio-davinci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index c5e05c8..86cfe18 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -545,7 +545,7 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 		chips[0].chip.to_irq = gpio_to_irq_unbanked;
 		chips[0].gpio_irq = bank_irq;
 		chips[0].gpio_unbanked = pdata->gpio_unbanked;
-		binten = BIT(0);
+		binten = GENMASK(pdata->gpio_unbanked / 16, 0);
 
 		/* AINTC handles mask/unmask; GPIO handles triggering */
 		irq = bank_irq;
-- 
1.8.3.2

