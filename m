From: Varka Bhadram <varkabhadram@gmail.com>
Subject: [PATCH gpio 4/4] drivers: gpio: use (!foo) instead of (foo == NULL)
Date: Tue, 31 Mar 2015 09:49:11 +0530
Message-ID: <1427775551-6908-5-git-send-email-varkab@cdac.in>
References: <1427775551-6908-1-git-send-email-varkab@cdac.in>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:35731 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750773AbbCaETy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Mar 2015 00:19:54 -0400
Received: by patj18 with SMTP id j18so7140121pat.2
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2015 21:19:53 -0700 (PDT)
In-Reply-To: <1427775551-6908-1-git-send-email-varkab@cdac.in>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, gnurou@gmail.com, Varka Bhadram <varkab@cdac.in>

Signed-off-by: Varka Bhadram <varkab@cdac.in>
---
 drivers/gpio/gpio-adp5588.c |    4 ++--
 drivers/gpio/gpio-arizona.c |    2 +-
 drivers/gpio/gpio-da9052.c  |    2 +-
 drivers/gpio/gpio-da9055.c  |    2 +-
 drivers/gpio/gpio-kempld.c  |    2 +-
 drivers/gpio/gpio-mc33880.c |    2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-adp5588.c b/drivers/gpio/gpio-adp5588.c
index 0de8c70..c90273d 100644
--- a/drivers/gpio/gpio-adp5588.c
+++ b/drivers/gpio/gpio-adp5588.c
@@ -367,7 +367,7 @@ static int adp5588_gpio_probe(struct i2c_client *client,
 	struct gpio_chip *gc;
 	int ret, i, revid;
 
-	if (pdata == NULL) {
+	if (!pdata) {
 		dev_err(&client->dev, "missing platform data\n");
 		return -ENODEV;
 	}
@@ -379,7 +379,7 @@ static int adp5588_gpio_probe(struct i2c_client *client,
 	}
 
 	dev = devm_kzalloc(&client->dev, sizeof(*dev), GFP_KERNEL);
-	if (dev == NULL)
+	if (!dev)
 		return -ENOMEM;
 
 	dev->client = client;
diff --git a/drivers/gpio/gpio-arizona.c b/drivers/gpio/gpio-arizona.c
index ab35038..eb5a0ce 100644
--- a/drivers/gpio/gpio-arizona.c
+++ b/drivers/gpio/gpio-arizona.c
@@ -103,7 +103,7 @@ static int arizona_gpio_probe(struct platform_device *pdev)
 
 	arizona_gpio = devm_kzalloc(&pdev->dev, sizeof(*arizona_gpio),
 				    GFP_KERNEL);
-	if (arizona_gpio == NULL)
+	if (!arizona_gpio)
 		return -ENOMEM;
 
 	arizona_gpio->arizona = arizona;
diff --git a/drivers/gpio/gpio-da9052.c b/drivers/gpio/gpio-da9052.c
index 389a4d2..2e9578e 100644
--- a/drivers/gpio/gpio-da9052.c
+++ b/drivers/gpio/gpio-da9052.c
@@ -212,7 +212,7 @@ static int da9052_gpio_probe(struct platform_device *pdev)
 	int ret;
 
 	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
-	if (gpio == NULL)
+	if (!gpio)
 		return -ENOMEM;
 
 	gpio->da9052 = dev_get_drvdata(pdev->dev.parent);
diff --git a/drivers/gpio/gpio-da9055.c b/drivers/gpio/gpio-da9055.c
index b8d7570..7227e6e 100644
--- a/drivers/gpio/gpio-da9055.c
+++ b/drivers/gpio/gpio-da9055.c
@@ -146,7 +146,7 @@ static int da9055_gpio_probe(struct platform_device *pdev)
 	int ret;
 
 	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
-	if (gpio == NULL)
+	if (!gpio)
 		return -ENOMEM;
 
 	gpio->da9055 = dev_get_drvdata(pdev->dev.parent);
diff --git a/drivers/gpio/gpio-kempld.c b/drivers/gpio/gpio-kempld.c
index 443518f..6b8115f 100644
--- a/drivers/gpio/gpio-kempld.c
+++ b/drivers/gpio/gpio-kempld.c
@@ -156,7 +156,7 @@ static int kempld_gpio_probe(struct platform_device *pdev)
 	}
 
 	gpio = devm_kzalloc(dev, sizeof(*gpio), GFP_KERNEL);
-	if (gpio == NULL)
+	if (!gpio)
 		return -ENOMEM;
 
 	gpio->pld = pld;
diff --git a/drivers/gpio/gpio-mc33880.c b/drivers/gpio/gpio-mc33880.c
index 4e3e160..a431604 100644
--- a/drivers/gpio/gpio-mc33880.c
+++ b/drivers/gpio/gpio-mc33880.c
@@ -151,7 +151,7 @@ static int mc33880_remove(struct spi_device *spi)
 	struct mc33880 *mc;
 
 	mc = spi_get_drvdata(spi);
-	if (mc == NULL)
+	if (!mc)
 		return -ENODEV;
 
 	gpiochip_remove(&mc->chip);
-- 
1.7.9.5

