From: Phil Reid <preid@electromag.com.au>
Subject: [PATCH 1/1] gpio: gpio-altera: Remove gpiochip on probe failure.
Date: Fri, 15 Jan 2016 11:32:22 +0800
Message-ID: <1452828742-57299-2-git-send-email-preid@electromag.com.au>
References: <1452828742-57299-1-git-send-email-preid@electromag.com.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from 203-59-230-133.perm.iinet.net.au ([203.59.230.133]:40571 "EHLO
	preid-centos7.electromag.com.au" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753222AbcAODjw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Thu, 14 Jan 2016 22:39:52 -0500
In-Reply-To: <1452828742-57299-1-git-send-email-preid@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: thloh@altera.com, linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org
Cc: Phil Reid <preid@electromag.com.au>

On failure to setup the irq altera_gpio_probe would return an error
but not call altera_gpio_probe. This resulted in kernel fault
"Unable to handle kernel paging request at virtual address xxxxxxxx"
later on in of_gpiochip_find_and_xlate.

Signed-off-by: Phil Reid <preid@electromag.com.au>
---
 drivers/gpio/gpio-altera.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index 3e6661b..7ed30f2 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -317,8 +317,8 @@ static int altera_gpio_probe(struct platform_device *pdev)
 		handle_simple_irq, IRQ_TYPE_NONE);
 
 	if (ret) {
-		dev_info(&pdev->dev, "could not add irqchip\n");
-		return ret;
+		dev_err(&pdev->dev, "could not add irqchip\n");
+		goto teardown;
 	}
 
 	gpiochip_set_chained_irqchip(&altera_gc->mmchip.gc,
@@ -331,6 +331,7 @@ static int altera_gpio_probe(struct platform_device *pdev)
 skip_irq:
 	return 0;
 teardown:
+	of_mm_gpiochip_remove(&altera_gc->mmchip);
 	pr_err("%s: registration failed with status %d\n",
 		node->full_name, ret);
 
-- 
1.8.3.1

