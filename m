From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 10/12] gpio: ts4900: Use of_device_get_match_data()
Date: Mon, 30 Apr 2018 09:38:17 +0200
Message-ID: <20180430073819.31827-10-thierry.reding@gmail.com>
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
 drivers/gpio/gpio-ts4900.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-ts4900.c b/drivers/gpio/gpio-ts4900.c
index 5bd21725e604..1da8d0586329 100644
--- a/drivers/gpio/gpio-ts4900.c
+++ b/drivers/gpio/gpio-ts4900.c
@@ -128,15 +128,10 @@ MODULE_DEVICE_TABLE(of, ts4900_gpio_of_match_table);
 static int ts4900_gpio_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
-	const struct of_device_id *match;
 	struct ts4900_gpio_priv *priv;
 	u32 ngpio;
 	int ret;
 
-	match = of_match_device(ts4900_gpio_of_match_table, &client->dev);
-	if (!match)
-		return -EINVAL;
-
 	if (of_property_read_u32(client->dev.of_node, "ngpios", &ngpio))
 		ngpio = DEFAULT_PIN_NUMBER;
 
@@ -148,7 +143,7 @@ static int ts4900_gpio_probe(struct i2c_client *client,
 	priv->gpio_chip.label = "ts4900-gpio";
 	priv->gpio_chip.ngpio = ngpio;
 	priv->gpio_chip.parent = &client->dev;
-	priv->input_bit = (uintptr_t)match->data;
+	priv->input_bit = (uintptr_t)of_device_get_match_data(&client->dev);
 
 	priv->regmap = devm_regmap_init_i2c(client, &ts4900_regmap_config);
 	if (IS_ERR(priv->regmap)) {
-- 
2.17.0
