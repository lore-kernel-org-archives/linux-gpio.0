From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] gpio: Move freeing of GPIO hogs before numbing of the device
Date: Mon, 19 Dec 2016 18:29:23 +0100
Message-ID: <1482168563-4562-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:49148 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758268AbcLSR3S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Dec 2016 12:29:18 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

When removing a gpiochip that uses GPIO hogging (e.g. by unloading the
chip's DT overlay), a warning is printed:

    gpio gpiochip8: REMOVING GPIOCHIP WITH GPIOS STILL REQUESTED

This happens because gpiochip_free_hogs() is called after the gdev->chip
pointer is reset to NULL. Hence __gpiod_free() cannot determine the
chip in use, and cannot clear flags nor call the optional chip-specific
.free() callback.

Move the call to gpiochip_free_hogs() up to fix this.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
I haven't verified that the problem happens on the below commit, but I
assume it does, so you may want to add:

Fixes: ff2b135922992756 ("gpio: make the gpiochip a real device")
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f4c26c7826cdfc0b..86bf3b84ada56d42 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1317,12 +1317,12 @@ void gpiochip_remove(struct gpio_chip *chip)
 
 	/* FIXME: should the legacy sysfs handling be moved to gpio_device? */
 	gpiochip_sysfs_unregister(gdev);
+	gpiochip_free_hogs(chip);
 	/* Numb the device, cancelling all outstanding operations */
 	gdev->chip = NULL;
 	gpiochip_irqchip_remove(chip);
 	acpi_gpiochip_remove(chip);
 	gpiochip_remove_pin_ranges(chip);
-	gpiochip_free_hogs(chip);
 	of_gpiochip_remove(chip);
 	/*
 	 * We accept no more calls into the driver from this point, so
-- 
1.9.1

