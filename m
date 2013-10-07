From: "Markus Mayer" <markus.mayer@linaro.org>
Subject: [PATCH] gpio: bcm281xx: Fix nested interrupt handler issue
Date: Mon, 7 Oct 2013 14:51:00 -0700
Message-ID: <1381182660-32426-1-git-send-email-markus.mayer@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mms3.broadcom.com ([216.31.210.19]:3810 "EHLO mms3.broadcom.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751508Ab3JGVvA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 7 Oct 2013 17:51:00 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linaro Patches <patches@linaro.org>, Alexandre Courbot <acourbot@nvidia.com>, Linux GPIO List <linux-gpio@vger.kernel.org>, Markus Mayer <markus.mayer@linaro.org>

The GPIO interrupt handler does not need to be marked as nested.

Signed-off-by: Markus Mayer <markus.mayer@linaro.org>
---

This patch is dependent on the following patches:

- http://patches.linaro.org/19933/
- http://patches.linaro.org/20490/

 drivers/gpio/gpio-bcm-kona.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index c0751a8..ff5c98e 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -478,7 +478,6 @@ static int bcm_kona_gpio_irq_map(struct irq_domain *d, unsigned int irq,
 		return ret;
 	irq_set_lockdep_class(irq, &gpio_lock_class);
 	irq_set_chip_and_handler(irq, &bcm_gpio_irq_chip, handle_simple_irq);
-	irq_set_nested_thread(irq, 1);
 #ifdef CONFIG_ARM
 	set_irq_flags(irq, IRQF_VALID);
 #else
-- 
1.7.9.5


