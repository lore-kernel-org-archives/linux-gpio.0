From: Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 02/23] gpio: clean up gpiochip_remove
Date: Mon,  4 May 2015 17:10:27 +0200
Message-ID: <1430752248-15401-3-git-send-email-johan@kernel.org>
References: <1430752248-15401-1-git-send-email-johan@kernel.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:34291 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751853AbbEDPNn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 4 May 2015 11:13:43 -0400
In-Reply-To: <1430752248-15401-1-git-send-email-johan@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>

Clean up gpiochip_remove somewhat and only output warning about removing
chip with GPIOs requested once.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpiolib.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 59eaa23767d8..5a5c208d31c7 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -325,8 +325,10 @@ static void gpiochip_free_hogs(struct gpio_chip *chip);
  */
 void gpiochip_remove(struct gpio_chip *chip)
 {
+	struct gpio_desc *desc;
 	unsigned long	flags;
 	unsigned	id;
+	bool		requested = false;
 
 	gpiochip_unexport(chip);
 
@@ -339,15 +341,17 @@ void gpiochip_remove(struct gpio_chip *chip)
 
 	spin_lock_irqsave(&gpio_lock, flags);
 	for (id = 0; id < chip->ngpio; id++) {
-		if (test_bit(FLAG_REQUESTED, &chip->desc[id].flags))
-			dev_crit(chip->dev, "REMOVING GPIOCHIP WITH GPIOS STILL REQUESTED\n");
+		desc = &chip->desc[id];
+		desc->chip = NULL;
+		if (test_bit(FLAG_REQUESTED, &desc->flags))
+			requested = true;
 	}
-	for (id = 0; id < chip->ngpio; id++)
-		chip->desc[id].chip = NULL;
-
 	list_del(&chip->list);
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
+	if (requested)
+		dev_crit(chip->dev, "REMOVING GPIOCHIP WITH GPIOS STILL REQUESTED\n");
+
 	kfree(chip->desc);
 	chip->desc = NULL;
 }
-- 
2.0.5

