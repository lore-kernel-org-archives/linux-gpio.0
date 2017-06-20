From: Bastien Nocera <hadess@hadess.net>
Subject: [PATCH] gpio: crystalcove: Uniquify driver name
Date: Tue, 20 Jun 2017 18:32:36 +0200
Message-ID: <20170620163236.16110-1-hadess@hadess.net>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:37322 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750923AbdFTQck (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Jun 2017 12:32:40 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Bastien Nocera <hadess@hadess.net>

---
 drivers/gpio/gpio-crystalcove.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-crystalcove.c b/drivers/gpio/gpio-crystalcove.c
index e60156ec0c18..4fb400150b03 100644
--- a/drivers/gpio/gpio-crystalcove.c
+++ b/drivers/gpio/gpio-crystalcove.c
@@ -267,7 +267,7 @@ static void crystalcove_irq_mask(struct irq_data *data)
 }
 
 static struct irq_chip crystalcove_irqchip = {
-	.name			= "Crystal Cove",
+	.name			= "Crystal Cove (GPIO)",
 	.irq_mask		= crystalcove_irq_mask,
 	.irq_unmask		= crystalcove_irq_unmask,
 	.irq_set_type		= crystalcove_irq_type,
-- 
2.13.0

