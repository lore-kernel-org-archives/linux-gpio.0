From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: document how to make combined GPIO+irqchip drivers
Date: Wed, 22 Jan 2014 15:03:10 +0100
Message-ID: <1390399390-9414-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:58725 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752549AbaAVODT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jan 2014 09:03:19 -0500
Received: by mail-wg0-f44.google.com with SMTP id l18so339658wgh.11
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jan 2014 06:03:18 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>

Write a few words on how GPIO drivers supplying an irqchip should
be written.

Cc: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/gpio/driver.txt | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/gpio/driver.txt b/Documentation/gpio/driver.txt
index 9da0bfa74781..9818b2055197 100644
--- a/Documentation/gpio/driver.txt
+++ b/Documentation/gpio/driver.txt
@@ -62,6 +62,36 @@ Any debugfs dump method should normally ignore signals which haven't been
 requested as GPIOs. They can use gpiochip_is_requested(), which returns either
 NULL or the label associated with that GPIO when it was requested.
 
+GPIO drivers providing IRQs
+---------------------------
+It is custom that GPIO drivers (GPIO chips) are also providing interrupts,
+most often cascaded off a parent interrupt controller, and in some special
+cases the GPIO logic is melded with a SoC:s primary interrupt controller.
+
+The IRQ portions of the GPIO block are implemented using an irqchip, using
+the header <linux/irq.h>. So basically such a driver is utilizing two sub-
+systems simultaneously: gpio and irq.
+
+It is legal for any IRQ consumer to request an IRQ from any irqchip no matter
+if that is a combined GPIO+IRQ driver. The basic premise is that gpio_chip and
+irq_chip are orthogonal, and offering their services independent of each
+other.
+
+gpiod_to_irq() is just a convenience function to figure out the IRQ for a
+certain GPIO line and should not be relied upon to have been called before
+the IRQ is used.
+
+So always prepare the hardware and make it ready for action in respective
+callbacks from the GPIO and irqchip APIs. Do not rely on gpio_to_irq() having
+been called first.
+
+This orthogonality leads to ambiguities that we need to solve: if there is
+competition inside the subsystem which side is using the resource (a certain
+GPIO line and register for example) it needs to deny certain operations and
+keep track of usage inside of the gpiolib subsystem. This is why the API
+below exists.
+
+
 Locking IRQ usage
 -----------------
 Input GPIOs can be used as IRQ signals. When this happens, a driver is requested
@@ -73,3 +103,7 @@ This will prevent the use of non-irq related GPIO APIs until the GPIO IRQ lock
 is released:
 
 	void gpiod_unlock_as_irq(struct gpio_desc *desc)
+
+When implementing an irqchip inside a GPIO driver, these two functions should
+typically be called in the .startup() and .shutdown() callbacks from the
+irqchip.
-- 
1.8.4.2

