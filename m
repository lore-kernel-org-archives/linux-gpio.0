From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH RESEND] gpio: tz1090-pdc: Use resource_size to fix
 off-by-one resource size calculation
Date: Wed, 21 Jan 2015 09:52:01 +0800
Message-ID: <1421805121.9831.3.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:40201 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750801AbbAUBwG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Jan 2015 20:52:06 -0500
Received: by mail-pa0-f45.google.com with SMTP id lf10so49510626pab.4
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2015 17:52:05 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: James Hogan <james.hogan@imgtec.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Acked-by: James Hogan <james.hogan@imgtec.com>
---
Hi Linus,
Seems this one was missed.
Thanks,
Axel
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



