From: Russell King <rmk+kernel@armlinux.org.uk>
Subject: [PATCH 02/33] gpio: sa1100: use sa11x0_gpio_set_wake()
Date: Mon, 29 Aug 2016 11:24:15 +0100
Message-ID: <E1beJjj-0000ls-IN@rmk-PC.armlinux.org.uk>
References: <20160829102328.GA28796@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:56227 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756527AbcH2KYV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Aug 2016 06:24:21 -0400
In-Reply-To: <20160829102328.GA28796@n2100.armlinux.org.uk>
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-pcmcia@lists.infradead.org
Cc: Alexandre Courbot <gnurou@gmail.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>

Use sa11x0_gpio_set_wake() to set the PWER register, as provided by
Dmitry some time back.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/gpio/gpio-sa1100.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-sa1100.c b/drivers/gpio/gpio-sa1100.c
index 8d8ee0ebf14c..fb9d52a57d78 100644
--- a/drivers/gpio/gpio-sa1100.c
+++ b/drivers/gpio/gpio-sa1100.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/io.h>
 #include <linux/syscore_ops.h>
+#include <soc/sa1100/pwer.h>
 #include <mach/hardware.h>
 #include <mach/irqs.h>
 
@@ -73,6 +74,7 @@ static struct gpio_chip sa1100_gpio_chip = {
 static int GPIO_IRQ_rising_edge;
 static int GPIO_IRQ_falling_edge;
 static int GPIO_IRQ_mask;
+static int GPIO_IRQ_wake;
 
 static int sa1100_gpio_type(struct irq_data *d, unsigned int type)
 {
@@ -131,11 +133,14 @@ static void sa1100_gpio_unmask(struct irq_data *d)
 
 static int sa1100_gpio_wake(struct irq_data *d, unsigned int on)
 {
-	if (on)
-		PWER |= BIT(d->hwirq);
-	else
-		PWER &= ~BIT(d->hwirq);
-	return 0;
+	int ret = sa11x0_gpio_set_wake(d->hwirq, on);
+	if (!ret) {
+		if (on)
+			GPIO_IRQ_wake |= BIT(d->hwirq);
+		else
+			GPIO_IRQ_wake &= ~BIT(d->hwirq);
+	}
+	return ret;
 }
 
 /*
@@ -201,8 +206,8 @@ static int sa1100_gpio_suspend(void)
 	/*
 	 * Set the appropriate edges for wakeup.
 	 */
-	GRER = PWER & GPIO_IRQ_rising_edge;
-	GFER = PWER & GPIO_IRQ_falling_edge;
+	GRER = GPIO_IRQ_wake & GPIO_IRQ_rising_edge;
+	GFER = GPIO_IRQ_wake & GPIO_IRQ_falling_edge;
 
 	/*
 	 * Clear any pending GPIO interrupts.
-- 
2.1.0

