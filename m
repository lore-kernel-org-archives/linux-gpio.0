From: Alexey Khoroshilov <khoroshilov@ispras.ru>
Subject: [PATCH] gpio: dwapb: Fix error handling in dwapb_gpio_probe()
Date: Tue, 28 Aug 2018 23:40:26 +0300
Message-ID: <1535488826-30200-1-git-send-email-khoroshilov@ispras.ru>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Hoan Tran <hotran@apm.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Alexey Khoroshilov <khoroshilov@ispras.ru>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
List-Id: linux-gpio@vger.kernel.org

If dwapb_gpio_add_port() fails in dwapb_gpio_probe(),
gpio->clk is left undisabled.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
---
 drivers/gpio/gpio-dwapb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 28da700f5f52..044888fd96a1 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -728,6 +728,7 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
 out_unregister:
 	dwapb_gpio_unregister(gpio);
 	dwapb_irq_teardown(gpio);
+	clk_disable_unprepare(gpio->clk);
 
 	return err;
 }
-- 
2.7.4
