From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 4/7] gpio: dwapb: use irq_linear_revmap() for the faster lookup
Date: Sat, 22 Mar 2014 17:16:41 +0100
Message-ID: <1395505004-22650-5-git-send-email-bigeasy@linutronix.de>
References: <1395505004-22650-1-git-send-email-bigeasy@linutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1395505004-22650-1-git-send-email-bigeasy@linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: atull@altera.com
Cc: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, dinguyen@altera.com, delicious.quinoa@gmail.com, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
List-Id: linux-gpio@vger.kernel.org

According to irq_linear_revmap() comment, it is slightly faster compared
to irq_find_mapping() since we don't use a radix tree but a linear
mapping.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/gpio/gpio-dwapb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 4d25a06b..541b893 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -92,7 +92,7 @@ static void dwapb_irq_handler(u32 irq, struct irq_desc *desc)
 
 	while (irq_status) {
 		int hwirq = fls(irq_status) - 1;
-		int gpio_irq = irq_find_mapping(gpio->domain, hwirq);
+		int gpio_irq = irq_linear_revmap(gpio->domain, hwirq);
 
 		generic_handle_irq(gpio_irq);
 		irq_status &= ~BIT(hwirq);
-- 
1.9.1
