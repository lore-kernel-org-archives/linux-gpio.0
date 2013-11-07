From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] gpio: rcar: NULL dereference on error in probe()
Date: Thu, 7 Nov 2013 10:56:51 +0300
Message-ID: <20131107075651.GN21844@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:21917 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752530Ab3KGH5J (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Nov 2013 02:57:09 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <damm@opensource.se>
Cc: Grant Likely <grant.likely@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <rob.herring@calxeda.com>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

It's not obvious from the label name but "err1" tries to release
"p->irq_domain" which leads to a NULL dereference.

Fixes: 119f5e448d32 ('gpio: Renesas R-Car GPIO driver V3')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index d3f15ae..fe088a3 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -381,7 +381,7 @@ static int gpio_rcar_probe(struct platform_device *pdev)
 	if (!p->irq_domain) {
 		ret = -ENXIO;
 		dev_err(&pdev->dev, "cannot initialize irq domain\n");
-		goto err1;
+		goto err0;
 	}
 
 	if (devm_request_irq(&pdev->dev, irq->start,
