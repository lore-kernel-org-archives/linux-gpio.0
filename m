From: Semen Protsenko <semen.protsenko@globallogic.com>
Subject: [PATCH v2] gpio: max732x: Fix irq-events handler
Date: Wed, 22 Apr 2015 16:20:41 +0300
Message-ID: <1429708841-31189-1-git-send-email-semen.protsenko@globallogic.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Grygorii Strashko <grygorii.strashko@globallogic.com>
List-Id: linux-gpio@vger.kernel.org

MAX732X clears all pending interrupts on I2C read (when interrupts
register is being read). Driver doesn't need to send any ACKs when
interrupt was handled. So replace handle_edge_irq() with
handle_simple_irq().

Using handle_edge_irq() (w/o .irq_ack callback set) may lead to NULL
pointer dereference in some cases. E.g. this was observed on
hibernation process:

  Unable to handle kernel NULL pointer dereference at virtual address 0
  Backtrace:
  (handle_edge_irq) from (resend_irqs)
  (resend_irqs) from (tasklet_action)
  (tasklet_action) from (__do_softirq)
  (__do_softirq) from (run_ksoftirqd)
  (run_ksoftirqd) from (smpboot_thread_fn)
  (smpboot_thread_fn) from (kthread)
  (kthread) from (ret_from_fork)

Signed-off-by: Semen Protsenko <semen.protsenko@globallogic.com>
---
 drivers/gpio/gpio-max732x.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index 1885e5c..86dc6b3 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -530,7 +530,7 @@ static int max732x_irq_setup(struct max732x_chip *chip,
 		ret =  gpiochip_irqchip_add(&chip->gpio_chip,
 					    &max732x_irq_chip,
 					    irq_base,
-					    handle_edge_irq,
+					    handle_simple_irq,
 					    IRQ_TYPE_NONE);
 		if (ret) {
 			dev_err(&client->dev,
-- 
1.7.9.5
