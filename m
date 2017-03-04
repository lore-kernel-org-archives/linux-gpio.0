From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 07/12] gpio: pxa: use devm_irq_alloc_descs()
Date: Sat,  4 Mar 2017 17:23:35 +0100
Message-ID: <1488644620-11488-8-git-send-email-bgolaszewski@baylibre.com>
References: <1488644620-11488-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:36608 "EHLO
        mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752429AbdCDQcN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 4 Mar 2017 11:32:13 -0500
Received: by mail-wm0-f41.google.com with SMTP id n11so35550578wma.1
        for <linux-gpio@vger.kernel.org>; Sat, 04 Mar 2017 08:32:12 -0800 (PST)
In-Reply-To: <1488644620-11488-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>

This driver never frees the interrupt descriptors it allocates. Fix
it by using the resource managed version of irq_alloc_descs().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-pxa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 76ac906..832f3e4 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -601,7 +601,7 @@ static int pxa_gpio_probe_dt(struct platform_device *pdev,
 	nr_gpios = gpio_id->gpio_nums;
 	pxa_last_gpio = nr_gpios - 1;
 
-	irq_base = irq_alloc_descs(-1, 0, nr_gpios, 0);
+	irq_base = devm_irq_alloc_descs(&pdev->dev, -1, 0, nr_gpios, 0);
 	if (irq_base < 0) {
 		dev_err(&pdev->dev, "Failed to allocate IRQ numbers\n");
 		return irq_base;
-- 
2.9.3

