From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCHv3 09/14] pinctrl: mcp23s08: simplify i2c pdata handling
Date: Mon, 15 May 2017 11:24:33 +0200
Message-ID: <20170515092438.13076-10-sebastian.reichel@collabora.co.uk>
References: <20170515092438.13076-1-sebastian.reichel@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170515092438.13076-1-sebastian.reichel@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Steven Miao <realmz6@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.co.uk>, linux-gpio@vger.kernel.org, adi-buildroot-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
List-Id: linux-gpio@vger.kernel.org

Simplify i2c pdata handling, so that it uses pdata when available
and falls back to reading device properties otherwise.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 3fc4195ad415..aec2dad26560 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -995,28 +995,16 @@ static int mcp230xx_probe(struct i2c_client *client,
 	struct mcp23s08_platform_data *pdata, local_pdata;
 	struct mcp23s08 *mcp;
 	int status;
-	const struct of_device_id *match;
 
-	match = of_match_device(of_match_ptr(mcp23s08_i2c_of_match),
-					&client->dev);
-	if (match) {
+	pdata = dev_get_platdata(&client->dev);
+	if (!pdata) {
 		pdata = &local_pdata;
 		pdata->base = -1;
-		pdata->irq_controller =	of_property_read_bool(
-					client->dev.of_node,
-					"interrupt-controller");
-		pdata->mirror = of_property_read_bool(client->dev.of_node,
-						      "microchip,irq-mirror");
-	} else {
-		pdata = dev_get_platdata(&client->dev);
-		if (!pdata) {
-			pdata = devm_kzalloc(&client->dev,
-					sizeof(struct mcp23s08_platform_data),
-					GFP_KERNEL);
-			if (!pdata)
-				return -ENOMEM;
-			pdata->base = -1;
-		}
+
+		pdata->irq_controller = device_property_read_bool(
+			&client->dev, "interrupt-controller");
+		pdata->mirror = device_property_read_bool(
+			&client->dev, "microchip,irq-mirror");
 	}
 
 	mcp = devm_kzalloc(&client->dev, sizeof(*mcp), GFP_KERNEL);
-- 
2.11.0
