From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] gpio-pisosr: Unlock on error in pisosr_gpio_refresh()
Date: Sat, 20 Feb 2016 00:53:30 +0300
Message-ID: <20160219215330.GA18915@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:17518 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1425727AbcBSVxu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Feb 2016 16:53:50 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, "Andrew F. Davis" <afd@ti.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

We should unlock before returning if spi_read() fails.

Fixes: df6df93c8a73 ('gpio: Add driver for SPI serializers')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpio/gpio-pisosr.c b/drivers/gpio/gpio-pisosr.c
index 58ea08df..f9f1074 100644
--- a/drivers/gpio/gpio-pisosr.c
+++ b/drivers/gpio/gpio-pisosr.c
@@ -53,12 +53,10 @@ static int pisosr_gpio_refresh(struct pisosr_gpio *gpio)
 	}
 
 	ret = spi_read(gpio->spi, gpio->buffer, gpio->buffer_size);
-	if (ret)
-		return ret;
 
 	mutex_unlock(&gpio->lock);
 
-	return 0;
+	return ret;
 }
 
 static int pisosr_gpio_get_direction(struct gpio_chip *chip,
