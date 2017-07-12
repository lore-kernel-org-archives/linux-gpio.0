From: Philipp Rosenberger <p.rosenberger@linutronix.de>
Subject: [PATCH 2/2] gpio: gpio-mxc: gpio_set_wake_irq() use proper return values
Date: Wed, 12 Jul 2017 10:36:40 +0200
Message-ID: <1499848600-7233-3-git-send-email-p.rosenberger@linutronix.de>
References: <1499848600-7233-1-git-send-email-p.rosenberger@linutronix.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:42317 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933960AbdGLIhN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jul 2017 04:37:13 -0400
In-Reply-To: <1499848600-7233-1-git-send-email-p.rosenberger@linutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de, Philipp Rosenberger <p.rosenberger@linutronix.de>

Errors from enable_irq_wake() in gpio_set_wake_irq() were silently ignored.
Thus led to the problem that gpio_set_wake_irq() always returned
successfully, even if enable_irq_wake() returned an error.

Signed-off-by: Philipp Rosenberger <p.rosenberger@linutronix.de>
---
 drivers/gpio/gpio-mxc.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 9269225..3dcd990 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -324,20 +324,21 @@ static int gpio_set_wake_irq(struct irq_data *d, u32 enable)
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct mxc_gpio_port *port = gc->private;
 	u32 gpio_idx = d->hwirq;
+	int ret;
 
 	if (enable) {
 		if (port->irq_high && (gpio_idx >= 16))
-			enable_irq_wake(port->irq_high);
+			ret = enable_irq_wake(port->irq_high);
 		else
-			enable_irq_wake(port->irq);
+			ret = enable_irq_wake(port->irq);
 	} else {
 		if (port->irq_high && (gpio_idx >= 16))
-			disable_irq_wake(port->irq_high);
+			ret = disable_irq_wake(port->irq_high);
 		else
-			disable_irq_wake(port->irq);
+			ret = disable_irq_wake(port->irq);
 	}
 
-	return 0;
+	return ret;
 }
 
 static int mxc_gpio_init_gc(struct mxc_gpio_port *port, int irq_base)
-- 
2.1.4

