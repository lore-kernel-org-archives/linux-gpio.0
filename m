From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] gpio: xlp: Add missing .owner and .label settings for
 gpio_chip
Date: Thu, 07 May 2015 15:34:37 +0800
Message-ID: <1430984077.23118.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:36759 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750845AbbEGHem (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 7 May 2015 03:34:42 -0400
Received: by pabsx10 with SMTP id sx10so32829661pab.3
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2015 00:34:42 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Kamlakant Patel <kamlakant.patel@broadcom.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-xlp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-xlp.c b/drivers/gpio/gpio-xlp.c
index 8532697..9bdab72 100644
--- a/drivers/gpio/gpio-xlp.c
+++ b/drivers/gpio/gpio-xlp.c
@@ -366,6 +366,8 @@ static int xlp_gpio_probe(struct platform_device *pdev)
 
 	gc = &priv->chip;
 
+	gc->owner = THIS_MODULE;
+	gc->label = dev_name(&pdev->dev);
 	gc->base = 0;
 	gc->dev = &pdev->dev;
 	gc->ngpio = ngpio;
-- 
2.1.0



