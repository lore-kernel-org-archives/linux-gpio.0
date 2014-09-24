From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: dwapb: fix pointer to integer cast
Date: Wed, 24 Sep 2014 13:31:40 +0200
Message-ID: <1411558300-20555-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f46.google.com ([74.125.82.46]:36855 "EHLO
	mail-wg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750783AbaIXLbr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Sep 2014 07:31:47 -0400
Received: by mail-wg0-f46.google.com with SMTP id a1so5780280wgh.29
        for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2014 04:31:45 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

The statements BUG_ON(ctx == 0) was implicitly casting a pointer
to an integer for comparison. Do this with a bool test instead
to get away from sparse warnings.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-dwapb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 7feaf9d3f3ca..b43cd84b61f1 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -626,7 +626,7 @@ static int dwapb_gpio_suspend(struct device *dev)
 		unsigned int idx = gpio->ports[i].idx;
 		struct dwapb_context *ctx = gpio->ports[i].ctx;
 
-		BUG_ON(ctx == 0);
+		BUG_ON(!ctx);
 
 		offset = GPIO_SWPORTA_DDR + idx * GPIO_SWPORT_DDR_SIZE;
 		ctx->dir = dwapb_read(gpio, offset);
@@ -668,7 +668,7 @@ static int dwapb_gpio_resume(struct device *dev)
 		unsigned int idx = gpio->ports[i].idx;
 		struct dwapb_context *ctx = gpio->ports[i].ctx;
 
-		BUG_ON(ctx == 0);
+		BUG_ON(!ctx);
 
 		offset = GPIO_SWPORTA_DR + idx * GPIO_SWPORT_DR_SIZE;
 		dwapb_write(gpio, offset, ctx->data);
-- 
1.9.3

