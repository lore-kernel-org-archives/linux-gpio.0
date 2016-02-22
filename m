From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] gpio: pisosr: Use devm_gpiod_get_optional for
 gpio->load_gpio
Date: Mon, 22 Feb 2016 20:16:51 +0800
Message-ID: <1456143411.23008.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:35988 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754186AbcBVMQz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Feb 2016 07:16:55 -0500
Received: by mail-pa0-f45.google.com with SMTP id yy13so90439214pab.3
        for <linux-gpio@vger.kernel.org>; Mon, 22 Feb 2016 04:16:55 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "Andrew F. Davis" <afd@ti.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

gpio->load_gpio is optional, so use devm_gpiod_get_optional instead.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-pisosr.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-pisosr.c b/drivers/gpio/gpio-pisosr.c
index f9f1074..8b8bf8f 100644
--- a/drivers/gpio/gpio-pisosr.c
+++ b/drivers/gpio/gpio-pisosr.c
@@ -125,15 +125,12 @@ static int pisosr_gpio_probe(struct spi_device *spi)
 	if (!gpio->buffer)
 		return -ENOMEM;
 
-	gpio->load_gpio = devm_gpiod_get(dev, "load", GPIOD_OUT_LOW);
+	gpio->load_gpio = devm_gpiod_get_optional(dev, "load", GPIOD_OUT_LOW);
 	if (IS_ERR(gpio->load_gpio)) {
 		ret = PTR_ERR(gpio->load_gpio);
-		if (ret != -ENOENT && ret != -ENOSYS) {
-			if (ret != -EPROBE_DEFER)
-				dev_err(dev, "Unable to allocate load GPIO\n");
-			return ret;
-		}
-		gpio->load_gpio = NULL;
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Unable to allocate load GPIO\n");
+		return ret;
 	}
 
 	mutex_init(&gpio->lock);
-- 
2.1.4



