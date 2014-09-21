From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH 2/3] gpio: xgene: Remove unneeded forward declation for
 struct xgene_gpio
Date: Sun, 21 Sep 2014 12:32:10 +0800
Message-ID: <1411273930.20539.1.camel@phoenix>
References: <1411273889.20539.0.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:47822 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751021AbaIUEcO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Sep 2014 00:32:14 -0400
Received: by mail-pa0-f46.google.com with SMTP id kx10so2499970pab.33
        for <linux-gpio@vger.kernel.org>; Sat, 20 Sep 2014 21:32:13 -0700 (PDT)
In-Reply-To: <1411273889.20539.0.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Feng Kan <fkan@apm.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-xgene.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index 256c785..cef92f4 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -38,8 +38,6 @@
 #define GPIO_BIT_OFFSET(x)	(x % XGENE_GPIOS_PER_BANK)
 #define GPIO_BANK_OFFSET(x)	((x / XGENE_GPIOS_PER_BANK) * GPIO_BANK_STRIDE)
 
-struct xgene_gpio;
-
 struct xgene_gpio {
 	struct gpio_chip	chip;
 	void __iomem		*base;
-- 
1.9.1



