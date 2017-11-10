From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH] gpio: davinci: Assign first bank regs for unbanked case
Date: Fri, 10 Nov 2017 16:37:07 +0530
Message-ID: <1510312027-28543-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from fllnx210.ext.ti.com ([198.47.19.17]:31323 "EHLO
        fllnx210.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752405AbdKJLHV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Nov 2017 06:07:21 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, j-keerthy@ti.com, t-kristo@ti.com

From: "J, KEERTHY" <j-keerthy@ti.com>

As per the re-design assign the first bank regs for unbanked
irq case. This was missed out in the original patch.

Signed-off-by: Keerthy <j-keerthy@ti.com>
Fixes: b5cf3fd827d2e1 ("gpio: davinci: Redesign driver to accommodate ngpios in one gpio chip")
---
 drivers/gpio/gpio-davinci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index f75d844..e4b3d7d 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -383,7 +383,7 @@ static int gpio_irq_type_unbanked(struct irq_data *data, unsigned trigger)
 	u32 mask;
 
 	d = (struct davinci_gpio_controller *)irq_data_get_irq_handler_data(data);
-	g = (struct davinci_gpio_regs __iomem *)d->regs;
+	g = (struct davinci_gpio_regs __iomem *)d->regs[0];
 	mask = __gpio_mask(data->irq - d->base_irq);
 
 	if (trigger & ~(IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
-- 
1.9.1

