From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH v2 2/3] gpio: davinci: Add new compatible for K3 AM654 SoCs
Date: Wed, 5 Jun 2019 13:32:58 +0530
Message-ID: <20190605080259.2462-3-j-keerthy@ti.com>
References: <20190605080259.2462-1-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190605080259.2462-1-j-keerthy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc: lokeshvutla@ti.com, linux-gpio@vger.kernel.org, t-kristo@ti.com, j-keerthy@ti.com, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Add new compatible for K3 AM654 SoCs.

Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 drivers/gpio/gpio-davinci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 0977590eb996..fc494a84a29d 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -632,6 +632,7 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 
 static const struct of_device_id davinci_gpio_ids[] = {
 	{ .compatible = "ti,keystone-gpio", keystone_gpio_get_irq_chip},
+	{ .compatible = "ti,am654-gpio", keystone_gpio_get_irq_chip},
 	{ .compatible = "ti,dm6441-gpio", davinci_gpio_get_irq_chip},
 	{ /* sentinel */ },
 };
-- 
2.17.1
