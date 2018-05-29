From: Sekhar Nori <nsekhar@ti.com>
Subject: [PATCH] gpio: davinci: fix build warning when !CONFIG_OF
Date: Tue, 29 May 2018 20:21:01 +0530
Message-ID: <20180529145101.20808-1-nsekhar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>
List-Id: linux-gpio@vger.kernel.org

This nukes the following warning that is seen when building without
OF support:

drivers/gpio/gpio-davinci.c:437:25: warning: ‘keystone_gpio_get_irq_chip’ defined but not used [-Wunused-function]
 static struct irq_chip *keystone_gpio_get_irq_chip(unsigned int irq)
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
Signed-off-by: Sekhar Nori <nsekhar@ti.com>
---
 drivers/gpio/gpio-davinci.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 987126c4c6f6..b574ecff7761 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -610,14 +610,12 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 	return 0;
 }
 
-#if IS_ENABLED(CONFIG_OF)
 static const struct of_device_id davinci_gpio_ids[] = {
 	{ .compatible = "ti,keystone-gpio", keystone_gpio_get_irq_chip},
 	{ .compatible = "ti,dm6441-gpio", davinci_gpio_get_irq_chip},
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, davinci_gpio_ids);
-#endif
 
 static struct platform_driver davinci_gpio_driver = {
 	.probe		= davinci_gpio_probe,
-- 
2.16.2
