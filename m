From: Liu Gang <Gang.Liu@nxp.com>
Subject: [PATCH] gpio: mpc8xxx: Correct irq handler function
Date: Fri, 21 Oct 2016 15:31:28 +0800
Message-ID: <1477035088-20587-1-git-send-email-Gang.Liu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, gnurou@gmail.com
Cc: mingkai.hu@nxp.com, leoyang.li@nxp.com, Liu Gang <Gang.Liu@nxp.com>
List-Id: linux-gpio@vger.kernel.org

>From the beginning of the gpio-mpc8xxx.c, the "handle_level_irq"
has being used to handle GPIO interrupts in the PowerPC/Layerscape
platforms. But actually, almost all PowerPC/Layerscape platforms
assert an interrupt request upon either a high-to-low change or
any change on the state of the signal.

So the "handle_level_irq" is not reasonable for PowerPC/Layerscape
GPIO interrupt, it should be "handle_edge_irq". Otherwise the system
may lost some interrupts from the PIN's state changes.

Signed-off-by: Liu Gang <Gang.Liu@nxp.com>
---
 drivers/gpio/gpio-mpc8xxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 425501c..793518a 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -239,7 +239,7 @@ static int mpc8xxx_gpio_irq_map(struct irq_domain *h, unsigned int irq,
 				irq_hw_number_t hwirq)
 {
 	irq_set_chip_data(irq, h->host_data);
-	irq_set_chip_and_handler(irq, &mpc8xxx_irq_chip, handle_level_irq);
+	irq_set_chip_and_handler(irq, &mpc8xxx_irq_chip, handle_edge_irq);
 
 	return 0;
 }
-- 
2.1.0.27.g96db324
