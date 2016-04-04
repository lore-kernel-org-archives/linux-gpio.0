From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH] gpio: zynq: Fix the error path
Date: Mon, 4 Apr 2016 23:44:06 +0530
Message-ID: <1459793646-16000-1-git-send-email-shubhraj@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-cys01nam02on0063.outbound.protection.outlook.com ([104.47.37.63]:54496
	"EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752972AbcDDS2p (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 4 Apr 2016 14:28:45 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linus.walleij@linaro.org, gnurou@gmail.com, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, Shubhrajyoti Datta <shubhraj@xilinx.com>

pm_runtime_disable is called only in remove it is missed
out in the error path.
Fix the same.

Signed-off-by: Shubhrajyoti Datta <shubhraj@xilinx.com>
---
 drivers/gpio/gpio-zynq.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 66d3d24..75c6355 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -713,7 +713,7 @@ static int zynq_gpio_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 	ret = pm_runtime_get_sync(&pdev->dev);
 	if (ret < 0)
-		return ret;
+		goto err_pm_dis;
 
 	/* report a bug if gpio chip registration fails */
 	ret = gpiochip_add_data(chip, gpio);
@@ -745,6 +745,8 @@ err_rm_gpiochip:
 	gpiochip_remove(chip);
 err_pm_put:
 	pm_runtime_put(&pdev->dev);
+err_pm_dis:
+	pm_runtime_disable(&pdev->dev);
 
 	return ret;
 }
-- 
1.7.1

