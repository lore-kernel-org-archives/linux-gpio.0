From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [RESEND PATCH] gpio: Drop owner assignment from i2c_driver
Date: Thu, 19 Nov 2015 12:57:11 +0900
Message-ID: <1447905431-30728-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:19066 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933261AbbKSD5U (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Nov 2015 22:57:20 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>

i2c_driver does not need to set an owner because i2c_register_driver()
will set it.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

---

The coccinelle script which generated the patch was sent here:
http://www.spinics.net/lists/kernel/msg2029903.html
---
 drivers/gpio/gpio-adnp.c       | 1 -
 drivers/gpio/gpio-max7300.c    | 1 -
 drivers/gpio/gpio-max732x.c    | 1 -
 drivers/gpio/gpio-mc9s08dz60.c | 1 -
 drivers/gpio/gpio-pcf857x.c    | 1 -
 drivers/gpio/gpio-sx150x.c     | 1 -
 6 files changed, 6 deletions(-)

diff --git a/drivers/gpio/gpio-adnp.c b/drivers/gpio/gpio-adnp.c
index d3d0a90fe542..85223aac8c55 100644
--- a/drivers/gpio/gpio-adnp.c
+++ b/drivers/gpio/gpio-adnp.c
@@ -547,7 +547,6 @@ MODULE_DEVICE_TABLE(of, adnp_of_match);
 static struct i2c_driver adnp_i2c_driver = {
 	.driver = {
 		.name = "gpio-adnp",
-		.owner = THIS_MODULE,
 		.of_match_table = adnp_of_match,
 	},
 	.probe = adnp_i2c_probe,
diff --git a/drivers/gpio/gpio-max7300.c b/drivers/gpio/gpio-max7300.c
index 0cc2c279ab5c..1ae9ba851c9a 100644
--- a/drivers/gpio/gpio-max7300.c
+++ b/drivers/gpio/gpio-max7300.c
@@ -65,7 +65,6 @@ MODULE_DEVICE_TABLE(i2c, max7300_id);
 static struct i2c_driver max7300_driver = {
 	.driver = {
 		.name = "max7300",
-		.owner = THIS_MODULE,
 	},
 	.probe = max7300_probe,
 	.remove = max7300_remove,
diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index 8c5252c6c327..2eb0f36ca89f 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -749,7 +749,6 @@ static int max732x_remove(struct i2c_client *client)
 static struct i2c_driver max732x_driver = {
 	.driver = {
 		.name		= "max732x",
-		.owner		= THIS_MODULE,
 		.of_match_table	= of_match_ptr(max732x_of_table),
 	},
 	.probe		= max732x_probe,
diff --git a/drivers/gpio/gpio-mc9s08dz60.c b/drivers/gpio/gpio-mc9s08dz60.c
index d62b4f8182bf..0a1505df3338 100644
--- a/drivers/gpio/gpio-mc9s08dz60.c
+++ b/drivers/gpio/gpio-mc9s08dz60.c
@@ -131,7 +131,6 @@ MODULE_DEVICE_TABLE(i2c, mc9s08dz60_id);
 
 static struct i2c_driver mc9s08dz60_i2c_driver = {
 	.driver = {
-		.owner = THIS_MODULE,
 		.name = "mc9s08dz60",
 	},
 	.probe = mc9s08dz60_probe,
diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index 1d4d9bc8b69d..eced5d0432c3 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -447,7 +447,6 @@ static int pcf857x_remove(struct i2c_client *client)
 static struct i2c_driver pcf857x_driver = {
 	.driver = {
 		.name	= "pcf857x",
-		.owner	= THIS_MODULE,
 		.of_match_table = of_match_ptr(pcf857x_of_table),
 	},
 	.probe	= pcf857x_probe,
diff --git a/drivers/gpio/gpio-sx150x.c b/drivers/gpio/gpio-sx150x.c
index 76f920173a2f..9f8d82cb2d31 100644
--- a/drivers/gpio/gpio-sx150x.c
+++ b/drivers/gpio/gpio-sx150x.c
@@ -680,7 +680,6 @@ static int sx150x_remove(struct i2c_client *client)
 static struct i2c_driver sx150x_driver = {
 	.driver = {
 		.name = "sx150x",
-		.owner = THIS_MODULE,
 		.of_match_table = of_match_ptr(sx150x_of_match),
 	},
 	.probe    = sx150x_probe,
-- 
1.9.1

