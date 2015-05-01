From: Christophe Jaillet <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/2] gpio: x-gene: Remove a useless memset
Date: Fri,  1 May 2015 14:29:06 +0200
Message-ID: <1430483346-10583-1-git-send-email-christophe.jaillet@wanadoo.fr>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp06.smtpout.orange.fr ([80.12.242.128]:31803 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753543AbbEAM3m (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 1 May 2015 08:29:42 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe Jaillet <christophe.jaillet@wanadoo.fr>

priv->irq is allocated using devm_kzalloc so there is no need to memset it.

Signed-off-by: Christophe Jaillet <christophe.jaillet@wanadoo.fr>
---
 drivers/gpio/gpio-xgene-sb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-xgene-sb.c b/drivers/gpio/gpio-xgene-sb.c
index fb9d29a..a7b8f8f 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -112,7 +112,6 @@ static int xgene_gpio_sb_probe(struct platform_device *pdev)
 				   GFP_KERNEL);
 	if (!priv->irq)
 		return -ENOMEM;
-	memset(priv->irq, 0, sizeof(u32) * XGENE_MAX_GPIO_DS);
 
 	for (i = 0; i < priv->nirq; i++) {
 		priv->irq[default_lines[i]] = platform_get_irq(pdev, i);
-- 
2.1.0

