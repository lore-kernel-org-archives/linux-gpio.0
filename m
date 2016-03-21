From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] gpio: xgene: Prevent NULL pointer dereference
Date: Mon, 21 Mar 2016 20:03:50 +0800
Message-ID: <1458561830.3490.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f179.google.com ([209.85.192.179]:34178 "EHLO
	mail-pf0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753853AbcCUMDy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Mar 2016 08:03:54 -0400
Received: by mail-pf0-f179.google.com with SMTP id x3so262448952pfb.1
        for <linux-gpio@vger.kernel.org>; Mon, 21 Mar 2016 05:03:54 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Feng Kan <fkan@apm.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

platform_get_resource() can return NULL, thus add NULL test to prevent NULL
pointer dereference.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-xgene.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index c0aa387..0dc9161 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -173,6 +173,11 @@ static int xgene_gpio_probe(struct platform_device *pdev)
 	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		err = -EINVAL;
+		goto err;
+	}
+
 	gpio->base = devm_ioremap_nocache(&pdev->dev, res->start,
 							resource_size(res));
 	if (!gpio->base) {
-- 
2.1.4



