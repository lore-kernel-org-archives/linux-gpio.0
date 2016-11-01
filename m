From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 01/14] pinctrl-sx150x: Rely on of_modalias_node for OF matching
Date: Tue,  1 Nov 2016 08:57:35 -0700
Message-ID: <1478015868-10309-2-git-send-email-andrew.smirnov@gmail.com>
References: <1478015868-10309-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478015868-10309-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, narmstrong@baylibre.com, linux-kernel@vger.kernel.org, cphealy@gmail.com, Andrey Smirnov <andrew.smirnov@gmail.com>
List-Id: linux-gpio@vger.kernel.org

None of the OF match table entries contain any compatiblity strings that
could not be matched against using i2c_device_id table above and
of_modalias_node. Besides that entries in OF match table do not cary
proper device variant information which is need by the drive. Those two
facts combined, IMHO, make a compelling case for removal of that code
altogether.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 drivers/pinctrl/pinctrl-sx150x.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index d2d4211..41b9e6a 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -861,14 +861,6 @@ static const struct i2c_device_id sx150x_id[] = {
 	{}
 };
 
-static const struct of_device_id sx150x_of_match[] = {
-	{ .compatible = "semtech,sx1508q" },
-	{ .compatible = "semtech,sx1509q" },
-	{ .compatible = "semtech,sx1506q" },
-	{ .compatible = "semtech,sx1502q" },
-	{},
-};
-
 static int sx150x_init_io(struct sx150x_pinctrl *pctl, u8 base, u16 cfg)
 {
 	int err = 0;
@@ -1049,7 +1041,6 @@ static int sx150x_probe(struct i2c_client *client,
 static struct i2c_driver sx150x_driver = {
 	.driver = {
 		.name = "sx150x-pinctrl",
-		.of_match_table = of_match_ptr(sx150x_of_match),
 	},
 	.probe    = sx150x_probe,
 	.id_table = sx150x_id,
-- 
2.5.5
