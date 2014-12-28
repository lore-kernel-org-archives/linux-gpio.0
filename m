From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH 1/2] gpio: tz1090: Use resource_size to fix off-by-one
 resource size calculation
Date: Sun, 28 Dec 2014 14:00:39 +0800
Message-ID: <1419746439.4496.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:63559 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751045AbaL1GBF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Dec 2014 01:01:05 -0500
Received: by mail-pa0-f44.google.com with SMTP id et14so15547329pad.3
        for <linux-gpio@vger.kernel.org>; Sat, 27 Dec 2014 22:01:04 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: James Hogan <james.hogan@imgtec.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-tz1090.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tz1090.c b/drivers/gpio/gpio-tz1090.c
index e3024bb..445660a 100644
--- a/drivers/gpio/gpio-tz1090.c
+++ b/drivers/gpio/gpio-tz1090.c
@@ -573,7 +573,7 @@ static int tz1090_gpio_probe(struct platform_device *pdev)
 
 	/* Ioremap the registers */
 	priv.reg = devm_ioremap(&pdev->dev, res_regs->start,
-				 res_regs->end - res_regs->start);
+				resource_size(res_regs));
 	if (!priv.reg) {
 		dev_err(&pdev->dev, "unable to ioremap registers\n");
 		return -ENOMEM;
-- 
1.9.1



