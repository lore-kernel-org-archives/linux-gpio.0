From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: adnp: rename "virq" to "child_irq"
Date: Fri, 11 Oct 2013 19:11:58 +0200
Message-ID: <1381511518-5929-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f52.google.com ([74.125.82.52]:43657 "EHLO
	mail-wg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750971Ab3JKRMH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2013 13:12:07 -0400
Received: by mail-wg0-f52.google.com with SMTP id m15so4562683wgh.7
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2013 10:12:05 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Lars Poeschel <poeschel@lemonage.de>

This variable is confusingly named, the different Linux IRQs
aren't any more virtual than any other Linux IRQ. Give it a
non-misleading name.

Cc: Lars Poeschel <poeschel@lemonage.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-adnp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-adnp.c b/drivers/gpio/gpio-adnp.c
index 6439e0e..b204033 100644
--- a/drivers/gpio/gpio-adnp.c
+++ b/drivers/gpio/gpio-adnp.c
@@ -325,9 +325,9 @@ static irqreturn_t adnp_irq(int irq, void *data)
 		pending &= isr & ier;
 
 		for_each_set_bit(bit, &pending, 8) {
-			unsigned int virq;
-			virq = irq_find_mapping(adnp->domain, base + bit);
-			handle_nested_irq(virq);
+			unsigned int child_irq;
+			child_irq = irq_find_mapping(adnp->domain, base + bit);
+			handle_nested_irq(child_irq);
 		}
 	}
 
-- 
1.8.3.1

