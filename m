From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 05/12] gpio: mxs: Use of_device_get_match_data()
Date: Mon, 30 Apr 2018 09:38:12 +0200
Message-ID: <20180430073819.31827-5-thierry.reding@gmail.com>
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
 drivers/gpio/gpio-mxs.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
index 435def22445d..5ad8d4db74db 100644
--- a/drivers/gpio/gpio-mxs.c
+++ b/drivers/gpio/gpio-mxs.c
@@ -290,8 +290,6 @@ MODULE_DEVICE_TABLE(of, mxs_gpio_dt_ids);
 
 static int mxs_gpio_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *of_id =
-			of_match_device(mxs_gpio_dt_ids, &pdev->dev);
 	struct device_node *np = pdev->dev.of_node;
 	struct device_node *parent;
 	static void __iomem *base;
@@ -306,7 +304,7 @@ static int mxs_gpio_probe(struct platform_device *pdev)
 	port->id = of_alias_get_id(np, "gpio");
 	if (port->id < 0)
 		return port->id;
-	port->devid = (enum mxs_gpio_id) of_id->data;
+	port->devid = (enum mxs_gpio_id)of_device_get_match_data(&pdev->dev);
 	port->dev = &pdev->dev;
 	port->irq = platform_get_irq(pdev, 0);
 	if (port->irq < 0)
-- 
2.17.0
