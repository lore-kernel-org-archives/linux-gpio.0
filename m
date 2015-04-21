From: Semen Protsenko <semen.protsenko@globallogic.com>
Subject: [PATCH 2/2] gpio: max732x: Fix irq-events handler
Date: Tue, 21 Apr 2015 20:28:38 +0300
Message-ID: <1429637318-11089-1-git-send-email-semen.protsenko@globallogic.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from exprod5og117.obsmtp.com ([64.18.0.149]:47386 "EHLO
	exprod5og117.obsmtp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754353AbbDUR30 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Apr 2015 13:29:26 -0400
Received: by lagv1 with SMTP id v1so156617192lag.3
        for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2015 10:29:24 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Grygorii Strashko <grygorii.strashko@globallogic.com>

MAX732X doesn't support edge type interrupt. So replace
handle_edge_irq() with handle_level_irq(), which uses
irq_mask/irq_unmask callbacks instead of irq_ack().

This wrong handler may lead to NULL pointer dereference in some cases.
E.g. this was observed on hibernation process:

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
index 1885e5c..edade14 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -530,7 +530,7 @@ static int max732x_irq_setup(struct max732x_chip *chip,
 		ret =  gpiochip_irqchip_add(&chip->gpio_chip,
 					    &max732x_irq_chip,
 					    irq_base,
-					    handle_edge_irq,
+					    handle_level_irq,
 					    IRQ_TYPE_NONE);
 		if (ret) {
 			dev_err(&client->dev,
-- 
1.7.9.5

