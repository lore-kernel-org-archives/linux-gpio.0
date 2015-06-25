From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH] gpio: zynq: Fix problem with unbalanced pm_runtime_enable
Date: Thu, 25 Jun 2015 10:29:19 +0200
Message-ID: <b4b2bb2d7747f8c9223fb50fd2868f77a7c7f63a.1435220957.git.michal.simek@xilinx.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:33961 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751340AbbFYI31 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Jun 2015 04:29:27 -0400
Received: by wgqq4 with SMTP id q4so55909653wgq.1
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2015 01:29:25 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org, monstr@monstr.eu
Cc: =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, linux-gpio@vger.kernel.org, Rob Herring <robherring2@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Josh Cartwright <josh.cartwright@ni.com>, linux-arm-kernel@lists.infradead.org

Add missing pm_runtime_disabled to remove().

Error log:
root@zynqmp:~# modprobe gpio_zynq
root@zynqmp:~# lsmod
    Not tainted
gpio_zynq 7086 0 - Live 0xffffffbffc00a000
root@zynqmp:~# rmmod gpio_zynq
root@zynqmp:~# lsmod
    Not tainted
root@zynqmp:~# modprobe gpio_zynq
[  246.924438] zynq-gpio ff0a0000.gpio: Unbalanced pm_runtime_enable!
root@zynqmp:~# rmmod gpio_zynq
root@zynqmp:~# lsmod
    Not tainted

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 drivers/gpio/gpio-zynq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 2e87c4b8da26..a78882389836 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -757,6 +757,7 @@ static int zynq_gpio_remove(struct platform_device *pdev)
 	gpiochip_remove(&gpio->chip);
 	clk_disable_unprepare(gpio->clk);
 	device_set_wakeup_capable(&pdev->dev, 0);
+	pm_runtime_disable(&pdev->dev);
 	return 0;
 }
 
-- 
2.3.5

