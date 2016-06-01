From: Helmut Grohne <h.grohne@intenta.de>
Subject: [PATCH] gpio: zynq: initialize clock even without CONFIG_PM
Date: Wed, 1 Jun 2016 13:03:04 +0200
Message-ID: <20160601110259.GA30501@laureti-dev>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.intenta.de ([194.31.246.158]:53605 "EHLO mail.intenta.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751423AbcFALJD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 1 Jun 2016 07:09:03 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Michal Simek <michal.simek@xilinx.com>, =?iso-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann@xilinx.com>

When the PM initialization was moved in the commit referenced below, the
code enabling the clock was removed from the probe function. On
CONFIG_PM=y kernels, this is not a problem as the pm resume hook enables
the clock, but when power management is disabled, all those pm_*
functions are noops and the clock is never enabled resulting in a
dysfunctional gpio controller.

Put the clock initialization back to support CONFIG_PM=n.

Signed-off-by: Helmut Grohne <h.grohne@intenta.de>
Fixes: 3773c195d387 ("gpio: zynq: Do PM initialization earlier to support gpio hogs")
---
 drivers/gpio/gpio-zynq.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

I verified that after this patch both CONFIG_PM=y and CONFIG_PM=n
configurations work.

Should this patch be copied to stable@vger.kernel.org? It seems that
CONFIG_PM=n is not a commonly used configuration anymore.

Please Cc me in any replies.

Helmut

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index e29cf58..3cbe63c 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -714,11 +714,17 @@ static int zynq_gpio_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "input clock not found.\n");
 		return PTR_ERR(gpio->clk);
 	}
+	ret = clk_prepare_enable(gpio->clk);
+	if (ret) {
+		dev_err(&pdev->dev, "Unable to enable clock.\n");
+		return ret;
+	}
 
+	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 	ret = pm_runtime_get_sync(&pdev->dev);
 	if (ret < 0)
-		return ret;
+		goto err_disable_unprepare_clk;
 
 	/* report a bug if gpio chip registration fails */
 	ret = gpiochip_add(chip);
@@ -750,6 +756,8 @@ err_rm_gpiochip:
 	gpiochip_remove(chip);
 err_pm_put:
 	pm_runtime_put(&pdev->dev);
+err_disable_unprepare_clk:
+	clk_disable_unprepare(gpio->clk);
 
 	return ret;
 }
-- 
2.1.4

