From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH] gpio-dwapb: reset mask register on probe
Date: Tue,  3 Mar 2015 11:47:41 +0300
Message-ID: <1425372461-17859-1-git-send-email-abrodkin@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-gpio@vger.kernel.org

It's possible that boot-loader that worked on CPU before Linux kernel
made some changes in GPIO controller registers. For example interrupts
could be all masked.

Current implementation of DW GPIO driver relies on default values in
mask register.

This is especially problematic in this DW GPIO driver because it sets 2
pairs of methods: .irq_eable/.irq_disable and .irq_mask/.irq_unmask. In
this case generic "irq_enable" function will use only
.irq_enable call-back and mask register will be never modified so
required interrupts will be finally unmasked.

To troubleshoot described problem on driver probe we just need to make
sure mask register is zeroed.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
---
 drivers/gpio/gpio-dwapb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 58faf04..be75860 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -370,6 +370,9 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
 		irq_create_mapping(gpio->domain, hwirq);
 
 	port->bgc.gc.to_irq = dwapb_gpio_to_irq;
+
+	/* Reset mask register */
+	dwapb_write(gpio, GPIO_INTMASK, 0);
 }
 
 static void dwapb_irq_teardown(struct dwapb_gpio *gpio)
-- 
2.1.0
