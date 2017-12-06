From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH] gpio: gpio-reg: fix build
Date: Wed, 6 Dec 2017 11:37:45 -0600
Message-ID: <20171206173745.19853-1-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from fllnx209.ext.ti.com ([198.47.19.16]:14229 "EHLO
        fllnx209.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751544AbdLFRim (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Dec 2017 12:38:42 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Russell King - ARM Linux <linux@armlinux.org.uk>

Revert changes introduced by commit f0fbe7bce733 ("gpio: Move irqdomain
into struct gpio_irq_chip") as they are not aplicable to this driver.

Cc: Russell King - ARM Linux <linux@armlinux.org.uk>
Fixes: f0fbe7bce733 ("gpio: Move irqdomain into struct gpio_irq_chip")
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
Sorry, for inconvenience, but this driver has no users in lkml and
it can't be enabled through defconfig - only selected, so builds can't
be verified in standard way.

 drivers/gpio/gpio-reg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-reg.c b/drivers/gpio/gpio-reg.c
index 23e771d..e85903e 100644
--- a/drivers/gpio/gpio-reg.c
+++ b/drivers/gpio/gpio-reg.c
@@ -103,8 +103,8 @@ static int gpio_reg_to_irq(struct gpio_chip *gc, unsigned offset)
 	struct gpio_reg *r = to_gpio_reg(gc);
 	int irq = r->irqs[offset];
 
-	if (irq >= 0 && r->irq.domain)
-		irq = irq_find_mapping(r->irq.domain, irq);
+	if (irq >= 0 && r->irqdomain)
+		irq = irq_find_mapping(r->irqdomain, irq);
 
 	return irq;
 }
-- 
2.10.5

