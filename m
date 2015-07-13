From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 06/19] gpio/zynq: Use irq_set_chip_handler_name_locked()
Date: Mon, 13 Jul 2015 20:41:24 -0000
Message-ID: <20150712232405.223520113@linutronix.de>
References: <20150712232317.244138485@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline;
 filename=gpio-zynq-Use-irq_set_chip_handler_name_locked.patch
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Jiang Liu <jiang.liu@linux.intel.com>
List-Id: linux-gpio@vger.kernel.org

Hand in irq_data and avoid the redundant lookup of irq_desc.

Originally-from: Jiang Liu <jiang.liu@linux.intel.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/gpio/gpio-zynq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 184c4b1b2558..8162f7952073 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -423,10 +423,10 @@ static int zynq_gpio_set_irq_type(struct irq_data *irq_data, unsigned int type)
 		       gpio->base_addr + ZYNQ_GPIO_INTANY_OFFSET(bank_num));
 
 	if (type & IRQ_TYPE_LEVEL_MASK) {
-		__irq_set_chip_handler_name_locked(irq_data->irq,
+		irq_set_chip_handler_name_locked(irq_data,
 			&zynq_gpio_level_irqchip, handle_fasteoi_irq, NULL);
 	} else {
-		__irq_set_chip_handler_name_locked(irq_data->irq,
+		irq_set_chip_handler_name_locked(irq_data,
 			&zynq_gpio_edge_irqchip, handle_level_irq, NULL);
 	}
 
-- 
2.1.4
