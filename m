From: Christian Lamparter <chunkeey@googlemail.com>
Subject: [PATCH v10 2/2] gpio: mmio: add MyBook Live GPIO support
Date: Fri, 13 May 2016 23:07:12 +0200
Message-ID: <9e2091228d1d653072d22d858eae2a7e08530d8b.1463172434.git.chunkeey@googlemail.com>
References: <cover.1463172434.git.chunkeey@googlemail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36449 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753561AbcEMVHa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 13 May 2016 17:07:30 -0400
In-Reply-To: <cover.1463172434.git.chunkeey@googlemail.com>
In-Reply-To: <cover.1463172434.git.chunkeey@googlemail.com>
References: <cover.1463172434.git.chunkeey@googlemail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Christian Lamparter <chunkeey@googlemail.com>, =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Joachim Eastwood <manabian@gmail.com>

This patch adds support for the Western Digital's
MyBook Live memory-mapped GPIO controllers.

The GPIOs will be supported by the generic driver
for memory-mapped GPIO controllers.

Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
---
 drivers/gpio/gpio-mmio.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index af583be..6ec144b 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -573,6 +573,7 @@ static void __iomem *bgpio_map(struct platform_device *pdev,
 
 #ifdef CONFIG_OF
 static const struct of_device_id bgpio_of_match[] = {
+	{ .compatible = "wd,mbl-gpio" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, bgpio_of_match);
@@ -592,6 +593,9 @@ static struct bgpio_pdata *bgpio_parse_dt(struct platform_device *pdev,
 
 	pdata->base = -1;
 
+	if (of_property_read_bool(pdev->dev.of_node, "no-output"))
+		*flags |= BGPIOF_NO_OUTPUT;
+
 	return pdata;
 }
 #else
-- 
2.8.1

