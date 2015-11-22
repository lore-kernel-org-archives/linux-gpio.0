From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH] gpio: 104-idio-16: Disable IRQ on device probe
Date: Sun, 22 Nov 2015 11:38:55 -0500
Message-ID: <20151122163855.GA18100@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yk0-f176.google.com ([209.85.160.176]:34081 "EHLO
	mail-yk0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752362AbbKVQjJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 22 Nov 2015 11:39:09 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

IRQ should be disabled on device probe so that the device IRQ is in a
known starting state. If IRQ is not disabled, interrupts may be reported
as handled by the IRQ handler, despite no irq_unmask calls made by the
user.

Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/gpio/gpio-104-idio-16.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpio-104-idio-16.c b/drivers/gpio/gpio-104-idio-16.c
index 81b6904..efe3ff7 100644
--- a/drivers/gpio/gpio-104-idio-16.c
+++ b/drivers/gpio/gpio-104-idio-16.c
@@ -242,6 +242,9 @@ static int __init idio_16_probe(struct platform_device *pdev)
 		goto err_gpio_register;
 	}
 
+	/* Disable IRQ by default */
+	outb(0, base + 2);
+
 	err = gpiochip_irqchip_add(&idio16gpio->chip, &idio_16_irqchip, 0,
 		handle_edge_irq, IRQ_TYPE_NONE);
 	if (err) {
-- 
2.4.10

