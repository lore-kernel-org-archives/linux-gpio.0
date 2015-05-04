From: Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 03/23] gpio: sysfs: fix redundant lock-as-irq handling
Date: Mon,  4 May 2015 17:10:28 +0200
Message-ID: <1430752248-15401-4-git-send-email-johan@kernel.org>
References: <1430752248-15401-1-git-send-email-johan@kernel.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175]:36824 "EHLO
	mail-lb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751740AbbEDPNn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 4 May 2015 11:13:43 -0400
In-Reply-To: <1430752248-15401-1-git-send-email-johan@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>

Drivers should call gpiochip_lock_as_irq (which prevents the pin
direction from being changed) in their irq_request_resources callbacks
but some drivers currently fail to do so.

Instead a second, explicit and often redundant call to lock-as-irq is
made by the sysfs-interface implementation after an irq has been
requested.

Move the explicit call before the irq-request to match the unlock done
after the irq is later released. Note that this also fixes an irq leak,
should the explicit call ever have failed.

Also add a comment about removing the redundant call once the broken
drivers have been fixed.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpiolib-sysfs.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index af3bc7a8033b..b2b62cc6f9e1 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -195,20 +195,28 @@ static int gpio_setup_irq(struct gpio_desc *desc, struct device *dev,
 		}
 	}
 
-	ret = request_any_context_irq(irq, gpio_sysfs_irq, irq_flags,
-				"gpiolib", value_sd);
+	/*
+	 * FIXME: This should be done in the irq_request_resources callback
+	 *        when the irq is requested, but a few drivers currently fail
+	 *        to do so.
+	 *
+	 *        Remove this redundant call (along with the corresponding
+	 *        unlock) when those drivers have been fixed.
+	 */
+	ret = gpiochip_lock_as_irq(desc->chip, gpio_chip_hwgpio(desc));
 	if (ret < 0)
 		goto free_id;
 
-	ret = gpiochip_lock_as_irq(desc->chip, gpio_chip_hwgpio(desc));
-	if (ret < 0) {
-		gpiod_warn(desc, "failed to flag the GPIO for IRQ\n");
-		goto free_id;
-	}
+	ret = request_any_context_irq(irq, gpio_sysfs_irq, irq_flags,
+				"gpiolib", value_sd);
+	if (ret < 0)
+		goto err_unlock;
 
 	desc->flags |= gpio_flags;
 	return 0;
 
+err_unlock:
+	gpiochip_unlock_as_irq(desc->chip, gpio_chip_hwgpio(desc));
 free_id:
 	idr_remove(&dirent_idr, id);
 	desc->flags &= GPIO_FLAGS_MASK;
-- 
2.0.5

