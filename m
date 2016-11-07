From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v2 01/15] pinctrl-sx150x: Improve OF device matching code
Date: Mon,  7 Nov 2016 08:53:09 -0800
Message-ID: <1478537603-23653-2-git-send-email-andrew.smirnov@gmail.com>
References: <1478537603-23653-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478537603-23653-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, linus.walleij@linaro.org, narmstrong@baylibre.com, linux-kernel@vger.kernel.org, cphealy@gmail.com
List-Id: linux-gpio@vger.kernel.org

Add proper device specific information to of_device_id table of the
driver and add code to match against and fetch said data from it.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 drivers/pinctrl/pinctrl-sx150x.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index d2d4211..0523f5a 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -25,6 +25,7 @@
 #include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/gpio.h>
 #include <linux/pinctrl/machine.h>
 #include <linux/pinctrl/pinconf.h>
@@ -862,10 +863,10 @@ static const struct i2c_device_id sx150x_id[] = {
 };
 
 static const struct of_device_id sx150x_of_match[] = {
-	{ .compatible = "semtech,sx1508q" },
-	{ .compatible = "semtech,sx1509q" },
-	{ .compatible = "semtech,sx1506q" },
-	{ .compatible = "semtech,sx1502q" },
+	{ .compatible = "semtech,sx1508q", .data = &sx1508q_device_data },
+	{ .compatible = "semtech,sx1509q", .data = &sx1509q_device_data },
+	{ .compatible = "semtech,sx1506q", .data = &sx1506q_device_data },
+	{ .compatible = "semtech,sx1502q", .data = &sx1502q_device_data },
 	{},
 };
 
@@ -956,9 +957,6 @@ static int sx150x_probe(struct i2c_client *client,
 	struct sx150x_pinctrl *pctl;
 	int ret;
 
-	if (!id->driver_data)
-		return -EINVAL;
-
 	if (!i2c_check_functionality(client->adapter, i2c_funcs))
 		return -ENOSYS;
 
@@ -968,7 +966,14 @@ static int sx150x_probe(struct i2c_client *client,
 
 	pctl->dev = dev;
 	pctl->client = client;
-	pctl->data = (void *)id->driver_data;
+
+	if (dev->of_node)
+		pctl->data = of_device_get_match_data(dev);
+	else
+		pctl->data = (struct sx150x_device_data *)id->driver_data;
+
+	if (!pctl->data)
+		return -EINVAL;
 
 	mutex_init(&pctl->lock);
 
-- 
2.5.5
