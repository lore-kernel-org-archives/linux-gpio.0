From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 5/5] genirq/timings: Move free timings out of spinlocked region
Date: Thu, 29 Jun 2017 23:33:39 +0200
Message-ID: <20170629214344.196130646@linutronix.de>
References: <20170629213334.375848050@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:59319 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752397AbdF2VpS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jun 2017 17:45:18 -0400
Content-Disposition: inline;
 filename=genirq-timings--Move-free-timings-out-of-spinlocked-region.patch
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Brian Norris <briannorris@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, Julia Cartwright <julia@ni.com>, linux-gpio@vger.kernel.org, John Keeping <john@metanate.com>, Doug Anderson <dianders@chromium.org>, Daniel Lezcano <daniel.lezcano@linaro.org>

No point to do memory management from a interrupt disabled spin locked
region.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 kernel/irq/manage.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -1489,7 +1489,6 @@ static struct irqaction *__free_irq(unsi
 	if (!desc->action) {
 		irq_settings_clr_disable_unlazy(desc);
 		irq_shutdown(desc);
-		irq_remove_timings(desc);
 	}
 
 #ifdef CONFIG_SMP
@@ -1531,8 +1530,10 @@ static struct irqaction *__free_irq(unsi
 		}
 	}
 
-	if (!desc->action)
+	if (!desc->action) {
 		irq_release_resources(desc);
+		irq_remove_timings(desc);
+	}
 
 	mutex_unlock(&desc->request_mutex);
 


