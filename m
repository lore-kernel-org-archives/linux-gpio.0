From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH 1/3] gpio: xgene: Fix missing spin_lock_init()
Date: Sun, 21 Sep 2014 12:31:29 +0800
Message-ID: <1411273889.20539.0.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:35654 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751021AbaIUEbd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Sep 2014 00:31:33 -0400
Received: by mail-pd0-f179.google.com with SMTP id ft15so2367113pdb.10
        for <linux-gpio@vger.kernel.org>; Sat, 20 Sep 2014 21:31:33 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Feng Kan <fkan@apm.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-xgene.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index e25ba14..256c785 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -189,6 +189,7 @@ static int xgene_gpio_probe(struct platform_device *pdev)
 
 	gpio->chip.ngpio = XGENE_MAX_GPIOS;
 
+	spin_lock_init(&gpio->lock);
 	gpio->chip.dev = &pdev->dev;
 	gpio->chip.direction_input = xgene_gpio_dir_in;
 	gpio->chip.direction_output = xgene_gpio_dir_out;
-- 
1.9.1



