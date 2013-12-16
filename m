From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH] gpio: sodaville: fix some error return code on error path
Date: Mon, 16 Dec 2013 13:52:04 +0800
Message-ID: <CAPgLHd8H6_-RwiQDwSVYo-wmyBOEQnJP7TFXdJa3JuW-nAvNDw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bk0-f53.google.com ([209.85.214.53]:50082 "EHLO
	mail-bk0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750923Ab3LPFwG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2013 00:52:06 -0500
Received: by mail-bk0-f53.google.com with SMTP id na10so2158503bkb.12
        for <linux-gpio@vger.kernel.org>; Sun, 15 Dec 2013 21:52:04 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, grant.likely@linaro.org, robh+dt@kernel.org
Cc: yongjun_wei@trendmicro.com.cn, linux-gpio@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Fix to return a negative error code from the error handling
case instead of 0.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/gpio/gpio-sodaville.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-sodaville.c b/drivers/gpio/gpio-sodaville.c
index 5d171e0..9bd2c50 100644
--- a/drivers/gpio/gpio-sodaville.c
+++ b/drivers/gpio/gpio-sodaville.c
@@ -176,8 +176,10 @@ static int sdv_register_irqsupport(struct sdv_gpio_chip_data *sd,
 
 	sd->id = irq_domain_add_legacy(pdev->dev.of_node, SDV_NUM_PUB_GPIOS,
 				sd->irq_base, 0, &irq_domain_sdv_ops, sd);
-	if (!sd->id)
+	if (!sd->id) {
+		ret = -ENODEV;
 		goto out_free_irq;
+	}
 	return 0;
 out_free_irq:
 	free_irq(pdev->irq, sd);
@@ -212,8 +214,10 @@ static int sdv_gpio_probe(struct pci_dev *pdev,
 	}
 
 	addr = pci_resource_start(pdev, GPIO_BAR);
-	if (!addr)
+	if (!addr) {
+		ret = -ENODEV;
 		goto release_reg;
+	}
 	sd->gpio_pub_base = ioremap(addr, pci_resource_len(pdev, GPIO_BAR));
 
 	prop = of_get_property(pdev->dev.of_node, "intel,muxctl", &len);

