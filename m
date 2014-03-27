From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 3/7] gpio: rcar: Add minimal runtime PM support
Date: Thu, 27 Mar 2014 21:47:38 +0100
Message-ID: <1395953262-4290-4-git-send-email-geert@linux-m68k.org>
References: <1395953262-4290-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:38345 "EHLO
	albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757374AbaC0Urz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Mar 2014 16:47:55 -0400
In-Reply-To: <1395953262-4290-1-git-send-email-geert@linux-m68k.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-sh@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, linux-gpio@vger.kernel.org

From: Geert Uytterhoeven <geert+renesas@glider.be>

This is just enough to automatically enable the functional clock, if
present. Clock management during suspend/resume is still to be added.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: linux-gpio@vger.kernel.org
---
 drivers/gpio/gpio-rcar.c |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 03c91482432c..c6995f6c3c40 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -26,6 +26,7 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_data/gpio-rcar.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/spinlock.h>
 #include <linux/slab.h>
 
@@ -377,6 +378,9 @@ static int gpio_rcar_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, p);
 
+	pm_runtime_enable(dev);
+	pm_runtime_get_sync(dev);
+
 	io = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 
@@ -460,6 +464,8 @@ static int gpio_rcar_probe(struct platform_device *pdev)
 err1:
 	irq_domain_remove(p->irq_domain);
 err0:
+	pm_runtime_put_sync(dev);
+	pm_runtime_disable(dev);
 	return ret;
 }
 
@@ -473,6 +479,8 @@ static int gpio_rcar_remove(struct platform_device *pdev)
 		return ret;
 
 	irq_domain_remove(p->irq_domain);
+	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
 	return 0;
 }
 
-- 
1.7.9.5

