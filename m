From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] gpio: sx150x: Fix comparing wrong value with
 chip->irq_masked
Date: Tue, 16 Dec 2014 14:22:27 +0800
Message-ID: <1418710947.23043.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:49388 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750813AbaLPGWc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Dec 2014 01:22:32 -0500
Received: by mail-pa0-f45.google.com with SMTP id lf10so12883613pab.32
        for <linux-gpio@vger.kernel.org>; Mon, 15 Dec 2014 22:22:32 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, Gregory Bean <gbean@codeaurora.org>

Fix a copy-paste bug.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-sx150x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-sx150x.c b/drivers/gpio/gpio-sx150x.c
index bce6c61..6e37257 100644
--- a/drivers/gpio/gpio-sx150x.c
+++ b/drivers/gpio/gpio-sx150x.c
@@ -401,7 +401,7 @@ static void sx150x_irq_bus_sync_unlock(struct irq_data *d)
 
 	/* Avoid updates if nothing changed */
 	if (chip->dev_sense == chip->irq_sense &&
-	    chip->dev_sense == chip->irq_masked)
+	    chip->dev_masked == chip->irq_masked)
 		goto out;
 
 	chip->dev_sense = chip->irq_sense;
-- 
1.9.1



