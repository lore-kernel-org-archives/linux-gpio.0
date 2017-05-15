From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCHv3 07/14] pinctrl: mcp23s08: use managed kzalloc for mcp
Date: Mon, 15 May 2017 11:24:31 +0200
Message-ID: <20170515092438.13076-8-sebastian.reichel@collabora.co.uk>
References: <20170515092438.13076-1-sebastian.reichel@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170515092438.13076-1-sebastian.reichel@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Steven Miao <realmz6@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.co.uk>, linux-gpio@vger.kernel.org, adi-buildroot-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
List-Id: linux-gpio@vger.kernel.org

Let's remove a few lines of code by using managed memory for mcp
variable.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 94d2c19a6989..4d2e1c3c0e87 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -1019,7 +1019,7 @@ static int mcp230xx_probe(struct i2c_client *client,
 		}
 	}
 
-	mcp = kzalloc(sizeof(*mcp), GFP_KERNEL);
+	mcp = devm_kzalloc(&client->dev, sizeof(*mcp), GFP_KERNEL);
 	if (!mcp)
 		return -ENOMEM;
 
@@ -1027,16 +1027,11 @@ static int mcp230xx_probe(struct i2c_client *client,
 	status = mcp23s08_probe_one(mcp, &client->dev, client, client->addr,
 				    id->driver_data, pdata, 0);
 	if (status)
-		goto fail;
+		return status;
 
 	i2c_set_clientdata(client, mcp);
 
 	return 0;
-
-fail:
-	kfree(mcp);
-
-	return status;
 }
 
 static int mcp230xx_remove(struct i2c_client *client)
@@ -1044,7 +1039,6 @@ static int mcp230xx_remove(struct i2c_client *client)
 	struct mcp23s08 *mcp = i2c_get_clientdata(client);
 
 	gpiochip_remove(&mcp->chip);
-	kfree(mcp);
 
 	return 0;
 }
-- 
2.11.0
