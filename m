From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] gpio: remove redundant owner assignments of drivers
Date: Mon, 23 May 2016 10:49:10 +0900
Message-ID: <1463968150-9334-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, patches@opensource.wolfsonmicro.com, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

A platform_driver need not set an owner since it will be populated
by platform_driver_register().
Likewise for mcb_driver (gpio-menz127.c).

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/gpio/gpio-menz127.c    | 1 -
 drivers/gpio/gpio-palmas.c     | 1 -
 drivers/gpio/gpio-rdc321x.c    | 1 -
 drivers/gpio/gpio-sch311x.c    | 1 -
 drivers/gpio/gpio-stmpe.c      | 1 -
 drivers/gpio/gpio-tc3589x.c    | 1 -
 drivers/gpio/gpio-tps6586x.c   | 1 -
 drivers/gpio/gpio-tps65910.c   | 1 -
 drivers/gpio/gpio-viperboard.c | 1 -
 drivers/gpio/gpio-wm831x.c     | 1 -
 drivers/gpio/gpio-wm8350.c     | 1 -
 drivers/gpio/gpio-wm8994.c     | 1 -
 12 files changed, 12 deletions(-)

diff --git a/drivers/gpio/gpio-menz127.c b/drivers/gpio/gpio-menz127.c
index cc103af..a1210e3 100644
--- a/drivers/gpio/gpio-menz127.c
+++ b/drivers/gpio/gpio-menz127.c
@@ -187,7 +187,6 @@ MODULE_DEVICE_TABLE(mcb, men_z127_ids);
 static struct mcb_driver men_z127_driver = {
 	.driver = {
 		.name = "z127-gpio",
-		.owner = THIS_MODULE,
 	},
 	.probe = men_z127_probe,
 	.remove = men_z127_remove,
diff --git a/drivers/gpio/gpio-palmas.c b/drivers/gpio/gpio-palmas.c
index e248707..8394744 100644
--- a/drivers/gpio/gpio-palmas.c
+++ b/drivers/gpio/gpio-palmas.c
@@ -208,7 +208,6 @@ static int palmas_gpio_probe(struct platform_device *pdev)
 
 static struct platform_driver palmas_gpio_driver = {
 	.driver.name	= "palmas-gpio",
-	.driver.owner	= THIS_MODULE,
 	.driver.of_match_table = of_palmas_gpio_match,
 	.probe		= palmas_gpio_probe,
 };
diff --git a/drivers/gpio/gpio-rdc321x.c b/drivers/gpio/gpio-rdc321x.c
index ec945b9..cbf0f9e 100644
--- a/drivers/gpio/gpio-rdc321x.c
+++ b/drivers/gpio/gpio-rdc321x.c
@@ -200,7 +200,6 @@ static int rdc321x_gpio_probe(struct platform_device *pdev)
 
 static struct platform_driver rdc321x_gpio_driver = {
 	.driver.name	= "rdc321x-gpio",
-	.driver.owner	= THIS_MODULE,
 	.probe		= rdc321x_gpio_probe,
 };
 
diff --git a/drivers/gpio/gpio-sch311x.c b/drivers/gpio/gpio-sch311x.c
index a03b38e..b96990c 100644
--- a/drivers/gpio/gpio-sch311x.c
+++ b/drivers/gpio/gpio-sch311x.c
@@ -296,7 +296,6 @@ static int sch311x_gpio_remove(struct platform_device *pdev)
 
 static struct platform_driver sch311x_gpio_driver = {
 	.driver.name	= DRV_NAME,
-	.driver.owner	= THIS_MODULE,
 	.probe		= sch311x_gpio_probe,
 	.remove		= sch311x_gpio_remove,
 };
diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 6f7af28..6d4d4c4 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -416,7 +416,6 @@ static struct platform_driver stmpe_gpio_driver = {
 	.driver = {
 		.suppress_bind_attrs	= true,
 		.name			= "stmpe-gpio",
-		.owner			= THIS_MODULE,
 	},
 	.probe		= stmpe_gpio_probe,
 };
diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
index 2e35ed3..8b36593 100644
--- a/drivers/gpio/gpio-tc3589x.c
+++ b/drivers/gpio/gpio-tc3589x.c
@@ -343,7 +343,6 @@ static int tc3589x_gpio_probe(struct platform_device *pdev)
 
 static struct platform_driver tc3589x_gpio_driver = {
 	.driver.name	= "tc3589x-gpio",
-	.driver.owner	= THIS_MODULE,
 	.probe		= tc3589x_gpio_probe,
 };
 
diff --git a/drivers/gpio/gpio-tps6586x.c b/drivers/gpio/gpio-tps6586x.c
index 6b15e68..042b9a2 100644
--- a/drivers/gpio/gpio-tps6586x.c
+++ b/drivers/gpio/gpio-tps6586x.c
@@ -131,7 +131,6 @@ static int tps6586x_gpio_probe(struct platform_device *pdev)
 
 static struct platform_driver tps6586x_gpio_driver = {
 	.driver.name	= "tps6586x-gpio",
-	.driver.owner	= THIS_MODULE,
 	.probe		= tps6586x_gpio_probe,
 };
 
diff --git a/drivers/gpio/gpio-tps65910.c b/drivers/gpio/gpio-tps65910.c
index 0ae6a5a..e63d7da 100644
--- a/drivers/gpio/gpio-tps65910.c
+++ b/drivers/gpio/gpio-tps65910.c
@@ -184,7 +184,6 @@ skip_init:
 
 static struct platform_driver tps65910_gpio_driver = {
 	.driver.name    = "tps65910-gpio",
-	.driver.owner   = THIS_MODULE,
 	.probe		= tps65910_gpio_probe,
 };
 
diff --git a/drivers/gpio/gpio-viperboard.c b/drivers/gpio/gpio-viperboard.c
index dec47aa..e6d1328 100644
--- a/drivers/gpio/gpio-viperboard.c
+++ b/drivers/gpio/gpio-viperboard.c
@@ -440,7 +440,6 @@ static int vprbrd_gpio_probe(struct platform_device *pdev)
 
 static struct platform_driver vprbrd_gpio_driver = {
 	.driver.name	= "viperboard-gpio",
-	.driver.owner	= THIS_MODULE,
 	.probe		= vprbrd_gpio_probe,
 };
 
diff --git a/drivers/gpio/gpio-wm831x.c b/drivers/gpio/gpio-wm831x.c
index 41ec783..21f97bc 100644
--- a/drivers/gpio/gpio-wm831x.c
+++ b/drivers/gpio/gpio-wm831x.c
@@ -296,7 +296,6 @@ static int wm831x_gpio_probe(struct platform_device *pdev)
 
 static struct platform_driver wm831x_gpio_driver = {
 	.driver.name	= "wm831x-gpio",
-	.driver.owner	= THIS_MODULE,
 	.probe		= wm831x_gpio_probe,
 };
 
diff --git a/drivers/gpio/gpio-wm8350.c b/drivers/gpio/gpio-wm8350.c
index 07d45a3..e976570 100644
--- a/drivers/gpio/gpio-wm8350.c
+++ b/drivers/gpio/gpio-wm8350.c
@@ -139,7 +139,6 @@ static int wm8350_gpio_probe(struct platform_device *pdev)
 
 static struct platform_driver wm8350_gpio_driver = {
 	.driver.name	= "wm8350-gpio",
-	.driver.owner	= THIS_MODULE,
 	.probe		= wm8350_gpio_probe,
 };
 
diff --git a/drivers/gpio/gpio-wm8994.c b/drivers/gpio/gpio-wm8994.c
index 744af38..2457aac 100644
--- a/drivers/gpio/gpio-wm8994.c
+++ b/drivers/gpio/gpio-wm8994.c
@@ -299,7 +299,6 @@ static int wm8994_gpio_probe(struct platform_device *pdev)
 
 static struct platform_driver wm8994_gpio_driver = {
 	.driver.name	= "wm8994-gpio",
-	.driver.owner	= THIS_MODULE,
 	.probe		= wm8994_gpio_probe,
 };
 
-- 
1.9.1
