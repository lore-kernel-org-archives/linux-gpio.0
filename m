From: Varka Bhadram <varkabhadram@gmail.com>
Subject: [PATCH gpio] gpio: removing kfree remove functionality
Date: Tue,  7 Apr 2015 21:34:40 +0530
Message-ID: <1428422680-4509-1-git-send-email-varkab@cdac.in>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:36431 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753607AbbDGQFO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Apr 2015 12:05:14 -0400
Received: by pabsx10 with SMTP id sx10so83200830pab.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2015 09:05:13 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, johan@kernel.org, gnurou@gmail.com

commit 3de07e5aaf290a0b58919 ("drivers: gpio: use devm_kzalloc")
introduce devm_kzalloc() for allocating the memory. In this case kfree
is not required to use. Above commit id introduced the bug that kfree
is not removed from the remove function.

This patch fix the above bug.

Signed-off-by: Varka Bhadram <varkab@cdac.in>
---
 drivers/gpio/gpio-adp5588.c  |    1 -
 drivers/gpio/gpio-mcp23s08.c |    2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-adp5588.c b/drivers/gpio/gpio-adp5588.c
index c90273d..d3fe6a6 100644
--- a/drivers/gpio/gpio-adp5588.c
+++ b/drivers/gpio/gpio-adp5588.c
@@ -471,7 +471,6 @@ static int adp5588_gpio_remove(struct i2c_client *client)
 
 	gpiochip_remove(&dev->gpio_chip);
 
-	kfree(dev);
 	return 0;
 }
 
diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
index a17b81f..2fc7ff8 100644
--- a/drivers/gpio/gpio-mcp23s08.c
+++ b/drivers/gpio/gpio-mcp23s08.c
@@ -1008,7 +1008,7 @@ static int mcp23s08_remove(struct spi_device *spi)
 			mcp23s08_irq_teardown(data->mcp[addr]);
 		gpiochip_remove(&data->mcp[addr]->chip);
 	}
-	kfree(data);
+
 	return 0;
 }
 
-- 
1.7.9.5

