From: Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 04/23] gpio: sysfs: preparatory clean ups
Date: Mon,  4 May 2015 17:10:29 +0200
Message-ID: <1430752248-15401-5-git-send-email-johan@kernel.org>
References: <1430752248-15401-1-git-send-email-johan@kernel.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:35371 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751405AbbEDPNm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 4 May 2015 11:13:42 -0400
In-Reply-To: <1430752248-15401-1-git-send-email-johan@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>

Put the recently introduced gpio-chip pointer to some more use in
gpiod_export.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpiolib-sysfs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index b2b62cc6f9e1..658ed28e6d7d 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -599,7 +599,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 		goto fail_unlock;
 	}
 
-	if (desc->chip->direction_input && desc->chip->direction_output &&
+	if (chip->direction_input && chip->direction_output &&
 			direction_may_change) {
 		set_bit(FLAG_SYSFS_DIR, &desc->flags);
 	}
@@ -607,10 +607,10 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
 	offset = gpio_chip_hwgpio(desc);
-	if (desc->chip->names && desc->chip->names[offset])
-		ioname = desc->chip->names[offset];
+	if (chip->names && chip->names[offset])
+		ioname = chip->names[offset];
 
-	dev = device_create_with_groups(&gpio_class, desc->chip->dev,
+	dev = device_create_with_groups(&gpio_class, chip->dev,
 					MKDEV(0, 0), desc, gpio_groups,
 					ioname ? ioname : "gpio%u",
 					desc_to_gpio(desc));
-- 
2.0.5

