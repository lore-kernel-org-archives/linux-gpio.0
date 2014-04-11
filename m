From: Axel Lin <axel.lin@ingics.com>
Subject: gpio: rdc321x: Question about rdc_gpio_direction_input
 implementation
Date: Fri, 11 Apr 2014 11:28:44 +0800
Message-ID: <1397186924.30538.2.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ve0-f181.google.com ([209.85.128.181]:33244 "EHLO
	mail-ve0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754697AbaDKD2u (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Apr 2014 23:28:50 -0400
Received: by mail-ve0-f181.google.com with SMTP id oy12so4364267veb.12
        for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2014 20:28:49 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Florian Fainelli <florian@openwrt.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

Hi Florian,
Current implementation in rdc_gpio_direction_input() looks wrong to me
because calling rdc_gpio_config(chip, gpio, 1) actually set the gpio to
OUTPUT HIGH rather than set the direction to INPUT.

I cannot find the datasheet, I'm wondering if below diff works.
Any chance to test it? I can send a formal patch if it works.

diff --git a/drivers/gpio/gpio-rdc321x.c b/drivers/gpio/gpio-rdc321x.c
index 88577c3..ccef383 100644
--- a/drivers/gpio/gpio-rdc321x.c
+++ b/drivers/gpio/gpio-rdc321x.c
@@ -119,10 +119,29 @@ unlock:
 	return err;
 }
 
-/* configure GPIO pin as input */
 static int rdc_gpio_direction_input(struct gpio_chip *chip, unsigned
gpio)
 {
-	return rdc_gpio_config(chip, gpio, 1);
+	struct rdc321x_gpio *gpch;
+	int reg, err;
+	u32 val;
+
+	gpch = container_of(chip, struct rdc321x_gpio, chip);
+	reg = gpio < 32 ? gpch->reg1_ctrl_base : gpch->reg2_ctrl_base;
+
+	spin_lock(&gpch->lock);
+
+	err = pci_read_config_dword(gpch->sb_pdev, reg, &val);
+	if (err)
+		goto unlock;
+
+	val &= ~(1 << (gpio & 0x1f));
+
+	err = pci_write_config_dword(gpch->sb_pdev, reg, val);
+
+unlock:
+	spin_unlock(&gpch->lock);
+
+	return err;
 }
 
 /*


