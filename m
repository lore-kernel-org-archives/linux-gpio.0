From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH 2/2] gpio: tz1090-pdc: Use resource_size to fix off-by-one
 resource size calculation
Date: Sun, 28 Dec 2014 14:01:50 +0800
Message-ID: <1419746510.4496.2.camel@phoenix>
References: <1419746439.4496.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:55980 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751045AbaL1GBy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Dec 2014 01:01:54 -0500
Received: by mail-pa0-f48.google.com with SMTP id rd3so15430188pab.35
        for <linux-gpio@vger.kernel.org>; Sat, 27 Dec 2014 22:01:54 -0800 (PST)
In-Reply-To: <1419746439.4496.1.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, James Hogan <james.hogan@imgtec.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-tz1090-pdc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tz1090-pdc.c b/drivers/gpio/gpio-tz1090-pdc.c
index d753622..ede7e40 100644
--- a/drivers/gpio/gpio-tz1090-pdc.c
+++ b/drivers/gpio/gpio-tz1090-pdc.c
@@ -190,7 +190,7 @@ static int tz1090_pdc_gpio_probe(struct platform_device *pdev)
 
 	/* Ioremap the registers */
 	priv->reg = devm_ioremap(&pdev->dev, res_regs->start,
-				 res_regs->end - res_regs->start);
+				 resource_size(res_regs));
 	if (!priv->reg) {
 		dev_err(&pdev->dev, "unable to ioremap registers\n");
 		return -ENOMEM;
-- 
1.9.1



