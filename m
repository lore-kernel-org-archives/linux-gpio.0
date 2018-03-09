From: Phil Edworthy <phil.edworthy@renesas.com>
Subject: [PATCH] gpio: dwapb: Add support for a bus clock
Date: Fri,  9 Mar 2018 10:34:11 +0000
Message-ID: <1520591651-4565-1-git-send-email-phil.edworthy@renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Hoan Tran <hotran@apm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Michel Pollet <michel.pollet@bp.renesas.com>
List-Id: linux-gpio@vger.kernel.org

From: Michel Pollet <michel.pollet@bp.renesas.com>

Enable specified clocks from DTS, if any.

Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>
---
 drivers/gpio/gpio-dwapb.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index b0704a8..56c58b5 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -27,6 +27,7 @@
 #include <linux/spinlock.h>
 #include <linux/platform_data/gpio-dwapb.h>
 #include <linux/slab.h>
+#include <linux/clk.h>
 
 #include "gpiolib.h"
 
@@ -637,6 +638,7 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
 	int err;
 	struct device *dev = &pdev->dev;
 	struct dwapb_platform_data *pdata = dev_get_platdata(dev);
+	struct clk *clk;
 
 	if (!pdata) {
 		pdata = dwapb_gpio_get_pdata(dev);
@@ -670,6 +672,10 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(gpio->regs))
 		return PTR_ERR(gpio->regs);
 
+	clk = devm_clk_get(&pdev->dev, NULL);
+	if (!IS_ERR(clk) && clk_prepare_enable(clk))
+		dev_info(&pdev->dev, "no clock source\n");
+
 	gpio->flags = 0;
 	if (dev->of_node) {
 		const struct of_device_id *of_devid;
-- 
2.7.4
