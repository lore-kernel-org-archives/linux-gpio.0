From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH] gpio: pxa: fixes non devicetree builds
Date: Fri, 18 Dec 2015 21:40:40 +0100
Message-ID: <1450471240-10264-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]:57585 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933011AbbLRUkw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Dec 2015 15:40:52 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>

The commit "gpio: pxa: change the interrupt management" should have
taken care of moving an ifdef to not englobe irqdomain related
structures anymore, as they are used now for all builds.

This repairs the broken builds where CONFIG_OF=n.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/gpio/gpio-pxa.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index eacb4b9b2677..c2d1a47ae784 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -554,19 +554,6 @@ static int pxa_gpio_nums(struct platform_device *pdev)
 	return count;
 }
 
-#ifdef CONFIG_OF
-static const struct of_device_id pxa_gpio_dt_ids[] = {
-	{ .compatible = "intel,pxa25x-gpio",	.data = &pxa25x_id, },
-	{ .compatible = "intel,pxa26x-gpio",	.data = &pxa26x_id, },
-	{ .compatible = "intel,pxa27x-gpio",	.data = &pxa27x_id, },
-	{ .compatible = "intel,pxa3xx-gpio",	.data = &pxa3xx_id, },
-	{ .compatible = "marvell,pxa93x-gpio",	.data = &pxa93x_id, },
-	{ .compatible = "marvell,mmp-gpio",	.data = &mmp_id, },
-	{ .compatible = "marvell,mmp2-gpio",	.data = &mmp2_id, },
-	{ .compatible = "marvell,pxa1928-gpio",	.data = &pxa1928_id, },
-	{}
-};
-
 static int pxa_irq_domain_map(struct irq_domain *d, unsigned int irq,
 			      irq_hw_number_t hw)
 {
@@ -582,6 +569,19 @@ const struct irq_domain_ops pxa_irq_domain_ops = {
 	.xlate	= irq_domain_xlate_twocell,
 };
 
+#ifdef CONFIG_OF
+static const struct of_device_id pxa_gpio_dt_ids[] = {
+	{ .compatible = "intel,pxa25x-gpio",	.data = &pxa25x_id, },
+	{ .compatible = "intel,pxa26x-gpio",	.data = &pxa26x_id, },
+	{ .compatible = "intel,pxa27x-gpio",	.data = &pxa27x_id, },
+	{ .compatible = "intel,pxa3xx-gpio",	.data = &pxa3xx_id, },
+	{ .compatible = "marvell,pxa93x-gpio",	.data = &pxa93x_id, },
+	{ .compatible = "marvell,mmp-gpio",	.data = &mmp_id, },
+	{ .compatible = "marvell,mmp2-gpio",	.data = &mmp2_id, },
+	{ .compatible = "marvell,pxa1928-gpio",	.data = &pxa1928_id, },
+	{}
+};
+
 static int pxa_gpio_probe_dt(struct platform_device *pdev,
 			     struct pxa_gpio_chip *pchip)
 {
-- 
2.1.4

