From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] gpio: 104-idi-48: Fix missing spin_lock_init for ack_lock
Date: Mon, 13 Jun 2016 13:48:53 +0800
Message-ID: <1465796933.11725.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f66.google.com ([209.85.220.66]:35032 "EHLO
	mail-pa0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750803AbcFMFs6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jun 2016 01:48:58 -0400
Received: by mail-pa0-f66.google.com with SMTP id hf6so1908240pac.2
        for <linux-gpio@vger.kernel.org>; Sun, 12 Jun 2016 22:48:58 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: William Breathitt Gray <vilhelm.gray@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

Fixes: 9ae482104cb9 ("gpio: 104-idi-48: Clear pending interrupt once in IRQ handler")
Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-104-idi-48.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-104-idi-48.c b/drivers/gpio/gpio-104-idi-48.c
index 6c75c83..2d2763e 100644
--- a/drivers/gpio/gpio-104-idi-48.c
+++ b/drivers/gpio/gpio-104-idi-48.c
@@ -247,6 +247,7 @@ static int idi_48_probe(struct device *dev, unsigned int id)
 	idi48gpio->irq = irq[id];
 
 	spin_lock_init(&idi48gpio->lock);
+	spin_lock_init(&idi48gpio->ack_lock);
 
 	dev_set_drvdata(dev, idi48gpio);
 
-- 
2.5.0

