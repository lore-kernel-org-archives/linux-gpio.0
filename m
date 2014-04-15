From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] gpio: pl061/sx150x: Remove unneeded include of
 linux/workqueue.h
Date: Tue, 15 Apr 2014 09:03:54 +0800
Message-ID: <1397523834.11920.0.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ve0-f170.google.com ([209.85.128.170]:47301 "EHLO
	mail-ve0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750932AbaDOBEA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Apr 2014 21:04:00 -0400
Received: by mail-ve0-f170.google.com with SMTP id pa12so8461622veb.15
        for <linux-gpio@vger.kernel.org>; Mon, 14 Apr 2014 18:03:59 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Baruch Siach <baruch@tkos.co.il>, Gregory Bean <gbean@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-pl061.c  | 1 -
 drivers/gpio/gpio-sx150x.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index b0f4752..84553d3 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -17,7 +17,6 @@
 #include <linux/irq.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/bitops.h>
-#include <linux/workqueue.h>
 #include <linux/gpio.h>
 #include <linux/device.h>
 #include <linux/amba/bus.h>
diff --git a/drivers/gpio/gpio-sx150x.c b/drivers/gpio/gpio-sx150x.c
index 13d73fb..b51ca9f 100644
--- a/drivers/gpio/gpio-sx150x.c
+++ b/drivers/gpio/gpio-sx150x.c
@@ -22,7 +22,6 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
-#include <linux/workqueue.h>
 #include <linux/i2c/sx150x.h>
 
 #define NO_UPDATE_PENDING	-1
-- 
1.8.3.2



