From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH v2 56/63] gpio: sodaville: Use of_property_read_u32 instead of of_read_number
Date: Tue,  5 Apr 2016 19:39:37 +0200
Message-ID: <1459877980-31872-17-git-send-email-alexanders83@web.de>
References: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.3]:57402 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759601AbcDERjx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Apr 2016 13:39:53 -0400
In-Reply-To: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Alexander Stein <alexanders83@web.de>, linux-gpio@vger.kernel.org

This allows the driver to be compile tested without adding a dummy to
of_read_number for !OF builds.

Signed-off-by: Alexander Stein <alexanders83@web.de>
---
 drivers/gpio/gpio-sodaville.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-sodaville.c b/drivers/gpio/gpio-sodaville.c
index e3cb6772f6ec..ddf6b941dffc 100644
--- a/drivers/gpio/gpio-sodaville.c
+++ b/drivers/gpio/gpio-sodaville.c
@@ -192,8 +192,6 @@ static int sdv_gpio_probe(struct pci_dev *pdev,
 {
 	struct sdv_gpio_chip_data *sd;
 	unsigned long addr;
-	const void *prop;
-	int len;
 	int ret;
 	u32 mux_val;
 
@@ -219,11 +217,8 @@ static int sdv_gpio_probe(struct pci_dev *pdev,
 	}
 	sd->gpio_pub_base = ioremap(addr, pci_resource_len(pdev, GPIO_BAR));
 
-	prop = of_get_property(pdev->dev.of_node, "intel,muxctl", &len);
-	if (prop && len == 4) {
-		mux_val = of_read_number(prop, 1);
+	if (!of_property_read_u32(pdev->dev.of_node, "intel,muxctl", &mux_val))
 		writel(mux_val, sd->gpio_pub_base + GPMUXCTL);
-	}
 
 	ret = bgpio_init(&sd->chip, &pdev->dev, 4,
 			sd->gpio_pub_base + GPINR, sd->gpio_pub_base + GPOUTR,
-- 
2.8.0

