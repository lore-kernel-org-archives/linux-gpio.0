From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 11/12] gpio: vf610: Use of_device_get_match_data()
Date: Mon, 30 Apr 2018 09:38:18 +0200
Message-ID: <20180430073819.31827-11-thierry.reding@gmail.com>
References: <20180430073819.31827-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180430073819.31827-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Use of_device_get_match_data() instead of open-coding it.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpio-vf610.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 4610cc2938ad..d4ad6d0e02a2 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -254,8 +254,6 @@ static struct irq_chip vf610_gpio_irq_chip = {
 
 static int vf610_gpio_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *of_id = of_match_device(vf610_gpio_dt_ids,
-							   &pdev->dev);
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct vf610_gpio_port *port;
@@ -267,7 +265,7 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	if (!port)
 		return -ENOMEM;
 
-	port->sdata = of_id->data;
+	port->sdata = of_device_get_match_data(dev);
 	iores = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	port->base = devm_ioremap_resource(dev, iores);
 	if (IS_ERR(port->base))
-- 
2.17.0
