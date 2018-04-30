From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 09/12] gpio: syscon: Use of_device_get_match_data()
Date: Mon, 30 Apr 2018 09:38:16 +0200
Message-ID: <20180430073819.31827-9-thierry.reding@gmail.com>
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
 drivers/gpio/gpio-syscon.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-syscon.c b/drivers/gpio/gpio-syscon.c
index 537cec7583fc..2512acd99027 100644
--- a/drivers/gpio/gpio-syscon.c
+++ b/drivers/gpio/gpio-syscon.c
@@ -182,20 +182,15 @@ MODULE_DEVICE_TABLE(of, syscon_gpio_ids);
 static int syscon_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	const struct of_device_id *of_id;
 	struct syscon_gpio_priv *priv;
 	struct device_node *np = dev->of_node;
 	int ret;
 
-	of_id = of_match_device(syscon_gpio_ids, dev);
-	if (!of_id)
-		return -ENODEV;
-
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	priv->data = of_id->data;
+	priv->data = of_device_get_match_data(dev);
 
 	if (priv->data->compatible) {
 		priv->syscon = syscon_regmap_lookup_by_compatible(
-- 
2.17.0
