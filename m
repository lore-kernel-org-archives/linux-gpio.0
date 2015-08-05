From: Eduardo Valentin <edubezval@gmail.com>
Subject: [PATCH 1/2] gpio/mxc: mask gpio interrupts in suspend
Date: Wed,  5 Aug 2015 10:23:07 -0700
Message-ID: <1438795388-22743-2-git-send-email-edubezval@gmail.com>
References: <1438795388-22743-1-git-send-email-edubezval@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438795388-22743-1-git-send-email-edubezval@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: ubrindis56@gmail.com, Fabio Estevam <fabio.estevam@freescale.com>, festevam@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Eduardo Valentin <edubezval@gmail.com>
List-Id: linux-gpio@vger.kernel.org

From: Ulises Brindis <ubrindis56@gmail.com>

Currently in the FSL platform all GPIO interrupts in a bank are muxed
into two GPIO lines to the GPC interrupt controller. In each GPIO bank
GPIOs 0-15 are OR'ed into one GPC interrupt controller interrupt and 16-31
are OR'ed into another. With the current code, if any of the 0-15 or
16-31 interrupts are marked as wakeup capable, all interrupts belonging
to that sub-bank (either 0-15 or 16-31) will wake up the device. This is
because interrupts are only being masked at the interrupt controller
and not at the GPIO controller.

This patch allows masking of GPIO interrupts at the GPIO controller during
suspend if they have not been labeled wakeup capable. This patch uses
preexisting IRQCHIP_MASK_ON_SUSPEND flag while initializing the GPIO
interrupts to get the desired behavior.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Eduardo Valentin <edubezval@gmail.com>
Signed-off-by: Ulises Brindis <ubrindis56@gmail.com>
---
 drivers/gpio/gpio-mxc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index ec1eb1b..9e5bdbd 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -354,6 +354,7 @@ static void __init mxc_gpio_init_gc(struct mxc_gpio_port *port, int irq_base)
 	ct->chip.irq_unmask = irq_gc_mask_set_bit;
 	ct->chip.irq_set_type = gpio_set_irq_type;
 	ct->chip.irq_set_wake = gpio_set_wake_irq;
+	ct->chip.flags = IRQCHIP_MASK_ON_SUSPEND;
 	ct->regs.ack = GPIO_ISR;
 	ct->regs.mask = GPIO_IMR;
 
-- 
2.5.0
