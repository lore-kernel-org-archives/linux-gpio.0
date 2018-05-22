From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH V3] gpio: mxc: add clock operation
Date: Tue, 22 May 2018 11:05:40 +0800
Message-ID: <1526958340-25883-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: linux-gpio@vger.kernel.org

Some i.MX SoCs have GPIO clock gates in CCM CCGR, such as
i.MX6SLL, need to enable clocks before accessing GPIO
registers, add optional clock operation for GPIO driver.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
changes since V2:
	remove the copyright change, since the change is already done by
	Fabio's patch [1/2] gpio: mxc: Switch to SPDX identifier, I redo
	the patch on top of it.
 drivers/gpio/gpio-mxc.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 6a9dc61..2f28299 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -7,6 +7,7 @@
 // Authors: Daniel Mack, Juergen Beisert.
 // Copyright (C) 2004-2010 Freescale Semiconductor, Inc. All Rights Reserved.
 
+#include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
@@ -47,6 +48,7 @@ struct mxc_gpio_hwdata {
 struct mxc_gpio_port {
 	struct list_head node;
 	void __iomem *base;
+	struct clk *clk;
 	int irq;
 	int irq_high;
 	struct irq_domain *domain;
@@ -421,6 +423,17 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	if (port->irq < 0)
 		return port->irq;
 
+	/* the controller clock is optional */
+	port->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(port->clk))
+		port->clk = NULL;
+
+	err = clk_prepare_enable(port->clk);
+	if (err) {
+		dev_err(&pdev->dev, "Unable to enable clock.\n");
+		return err;
+	}
+
 	/* disable the interrupt and clear the status */
 	writel(0, port->base + GPIO_IMR);
 	writel(~0, port->base + GPIO_ISR);
@@ -489,6 +502,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 out_irqdomain_remove:
 	irq_domain_remove(port->domain);
 out_bgio:
+	clk_disable_unprepare(port->clk);
 	dev_info(&pdev->dev, "%s failed with errno %d\n", __func__, err);
 	return err;
 }
-- 
2.7.4
