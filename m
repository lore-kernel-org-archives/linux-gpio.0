From: Varka Bhadram <varkabhadram@gmail.com>
Subject: [PATCH gpio 1/4] drivers: gpio: use devm_kzalloc
Date: Tue, 31 Mar 2015 09:49:08 +0530
Message-ID: <1427775551-6908-2-git-send-email-varkab@cdac.in>
References: <1427775551-6908-1-git-send-email-varkab@cdac.in>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f174.google.com ([209.85.192.174]:35835 "EHLO
	mail-pd0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750773AbbCaETn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Mar 2015 00:19:43 -0400
Received: by pddn5 with SMTP id n5so7492372pdd.2
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2015 21:19:43 -0700 (PDT)
In-Reply-To: <1427775551-6908-1-git-send-email-varkab@cdac.in>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, gnurou@gmail.com, Varka Bhadram <varkab@cdac.in>

We can use devres API for allocating memory. No need of using kfree.

Signed-off-by: Varka Bhadram <varkab@cdac.in>
---
 drivers/gpio/gpio-adp5588.c  |    3 +--
 drivers/gpio/gpio-mcp23s08.c |    7 ++++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-adp5588.c b/drivers/gpio/gpio-adp5588.c
index 3beed6e..0de8c70 100644
--- a/drivers/gpio/gpio-adp5588.c
+++ b/drivers/gpio/gpio-adp5588.c
@@ -378,7 +378,7 @@ static int adp5588_gpio_probe(struct i2c_client *client,
 		return -EIO;
 	}
 
-	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+	dev = devm_kzalloc(&client->dev, sizeof(*dev), GFP_KERNEL);
 	if (dev == NULL)
 		return -ENOMEM;
 
@@ -446,7 +446,6 @@ static int adp5588_gpio_probe(struct i2c_client *client,
 err_irq:
 	adp5588_irq_teardown(dev);
 err:
-	kfree(dev);
 	return ret;
 }
 
diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
index eea5d7e..a17b81f 100644
--- a/drivers/gpio/gpio-mcp23s08.c
+++ b/drivers/gpio/gpio-mcp23s08.c
@@ -949,10 +949,12 @@ static int mcp23s08_probe(struct spi_device *spi)
 	if (!chips)
 		return -ENODEV;
 
-	data = kzalloc(sizeof(*data) + chips * sizeof(struct mcp23s08),
-			GFP_KERNEL);
+	data = devm_kzalloc(&spi->dev,
+			    sizeof(*data) + chips * sizeof(struct mcp23s08),
+			    GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
+
 	spi_set_drvdata(spi, data);
 
 	spi->irq = irq_of_parse_and_map(spi->dev.of_node, 0);
@@ -989,7 +991,6 @@ fail:
 			continue;
 		gpiochip_remove(&data->mcp[addr]->chip);
 	}
-	kfree(data);
 	return status;
 }
 
-- 
1.7.9.5

